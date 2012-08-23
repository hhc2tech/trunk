/*************************************************************************
*  Copyright (C) 2006 by Bruno Chareyre                                  *
*  bruno.chareyre@hmg.inpg.fr                                            *
*                                                                        *
*  This program is free software; it is licensed under the terms of the  *
*  GNU General Public License v2 or later. See file LICENSE for details. *
*************************************************************************/

#include"GlobalStiffnessTimeStepper.hpp"
#include<yade/pkg/dem/FrictPhys.hpp>
#include<yade/pkg/dem/ScGeom.hpp>
#include<yade/pkg/dem/DemXDofGeom.hpp>
#include<yade/core/Interaction.hpp>
#include<yade/core/Scene.hpp>
#include<yade/core/Clump.hpp>

CREATE_LOGGER(GlobalStiffnessTimeStepper);
YADE_PLUGIN((GlobalStiffnessTimeStepper));

GlobalStiffnessTimeStepper::~GlobalStiffnessTimeStepper() {}

void GlobalStiffnessTimeStepper::findTimeStepFromBody(const shared_ptr<Body>& body, Scene * ncb)
{
	State* sdec=body->state.get();
	Vector3r&  stiffness= stiffnesses[body->getId()];
	Vector3r& Rstiffness=Rstiffnesses[body->getId()];
	
	if(body->isClump()) {// if clump, we sum stifnesses of all members
		const shared_ptr<Clump>& clump=YADE_PTR_CAST<Clump>(body->shape);
		FOREACH(Clump::MemberMap::value_type& B, clump->members){
			const shared_ptr<Body>& b = Body::byId(B.first,scene);
			stiffness+=stiffnesses[b->getId()];
			Rstiffness+=Rstiffnesses[b->getId()];
		}
	}
	
	if(!sdec || stiffness==Vector3r::Zero()){
		if (densityScaling) sdec->densityScaling = max(0.95*sdec->densityScaling,0.8*pow(defaultDt/targetDt,2.0));
		return; // not possible to compute!
	}
	
	Real dtx, dty, dtz;
	Real dt = max( max (stiffness.x(), stiffness.y()), stiffness.z() );
	if (dt!=0) {
		dt = sdec->mass/dt;  computedSomething = true;}//dt = squared eigenperiod of translational motion 
	else dt = Mathr::MAX_REAL;
	
	if (Rstiffness.x()!=0) {
		dtx = sdec->inertia.x()/Rstiffness.x();  computedSomething = true;}//dtx = squared eigenperiod of rotational motion around x
	else dtx = Mathr::MAX_REAL;	
	if (Rstiffness.y()!=0) {
		dty = sdec->inertia.y()/Rstiffness.y();  computedSomething = true;}
	else dty = Mathr::MAX_REAL;
	if (Rstiffness.z()!=0) {
		dtz = sdec->inertia.z()/Rstiffness.z();  computedSomething = true;}
	else dtz = Mathr::MAX_REAL;
	
	Real Rdt =  std::min( std::min (dtx, dty), dtz );//Rdt = smallest squared eigenperiod for rotational motions
	dt = 1.41044*timestepSafetyCoefficient*std::sqrt(std::min(dt,Rdt));//1.41044 = sqrt(2)
	//if there is a target dt, then we apply density scaling on the body
	if (densityScaling) {
		Real prevSc = sdec->densityScaling;
		sdec->densityScaling = min(1.01*sdec->densityScaling,0.8*pow(dt /targetDt,2.0));
// 		sdec->vel*=min(pow(sdec->densityScaling/prevSc,2),1.);
// 		sdec->angVel*=min(pow(sdec->densityScaling/prevSc,2),1.);
		newDt=targetDt;
	}
	//else we update dt normaly
	else {newDt = std::min(dt,newDt);}
}

bool GlobalStiffnessTimeStepper::isActivated()
{
	return (active && ((!computedOnce) || (scene->iter % timeStepUpdateInterval == 0) || (scene->iter < (long int) 2) ));
}

void GlobalStiffnessTimeStepper::computeTimeStep(Scene* ncb)
{
	// for some reason, this line is necessary to have correct functioning (no idea _why_)
	// see scripts/test/compare-identical.py, run with or without active=active.
	active=active;
	if (defaultDt<0) defaultDt= timestepSafetyCoefficient*Shop::PWaveTimeStep(Omega::instance().getScene());
	computeStiffnesses(ncb);

	shared_ptr<BodyContainer>& bodies = ncb->bodies;
	newDt = Mathr::MAX_REAL;
	computedSomething=false;
	BodyContainer::iterator bi    = bodies->begin();
	BodyContainer::iterator biEnd = bodies->end();
	for(  ; bi!=biEnd ; ++bi ){
		shared_ptr<Body> b = *bi;
		if (b->isDynamic() && !b->isClumpMember()) findTimeStepFromBody(b, ncb);
		
	}
	if(densityScaling) (newDt=targetDt);
	if(computedSomething || densityScaling){
		previousDt = min ( min(newDt , maxDt), 1.05*previousDt );// at maximum, dt will be multiplied by 1.05 in one iterration, this is to prevent brutal switches from 0.000... to 1 in some computations
		scene->dt=previousDt;
		computedOnce = true;}
	else if (!computedOnce) scene->dt=defaultDt;
	LOG_INFO("computed timestep " << newDt <<
			(scene->dt==newDt ? string(", appplied") :
			string(", BUT timestep is ")+lexical_cast<string>(scene->dt))<<".");
}

void GlobalStiffnessTimeStepper::computeStiffnesses(Scene* rb){
	/* check size */
	size_t size=stiffnesses.size();
	if(size<rb->bodies->size()){
		size=rb->bodies->size();
		stiffnesses.resize(size); Rstiffnesses.resize(size);
	}
	/* reset stored values */
	memset(& stiffnesses[0],0,sizeof(Vector3r)*size);
	memset(&Rstiffnesses[0],0,sizeof(Vector3r)*size);
	FOREACH(const shared_ptr<Interaction>& contact, *rb->interactions){
		if(!contact->isReal()) continue;

		GenericSpheresContact* geom=YADE_CAST<GenericSpheresContact*>(contact->geom.get()); assert(geom);
		NormShearPhys* phys=YADE_CAST<NormShearPhys*>(contact->phys.get()); assert(phys);
		// all we need for getting stiffness
		Vector3r& normal=geom->normal; Real& kn=phys->kn; Real& ks=phys->ks; Real& radius1=geom->refR1; Real& radius2=geom->refR2;
		Real fn = (static_cast<NormShearPhys *> (contact->phys.get()))->normalForce.squaredNorm();
		if (fn==0) continue;//Is it a problem with some laws? I still don't see why.
		
		//Diagonal terms of the translational stiffness matrix
		Vector3r diag_stiffness = Vector3r(std::pow(normal.x(),2),std::pow(normal.y(),2),std::pow(normal.z(),2));
		diag_stiffness *= kn-ks;
		diag_stiffness = diag_stiffness + Vector3r(1,1,1)*ks;

		//diagonal terms of the rotational stiffness matrix
		// Vector3r branch1 = currentContactGeometry->normal*currentContactGeometry->radius1;
		// Vector3r branch2 = currentContactGeometry->normal*currentContactGeometry->radius2;
		Vector3r diag_Rstiffness =
			Vector3r(std::pow(normal.y(),2)+std::pow(normal.z(),2),
				std::pow(normal.x(),2)+std::pow(normal.z(),2),
				std::pow(normal.x(),2)+std::pow(normal.y(),2));
		diag_Rstiffness *= ks;
		//NOTE : contact laws with moments would be handled correctly by summing directly bending+twisting stiffness to diag_Rstiffness. The fact that there is no problem currently with e.g. cohesiveFrict law is probably because final computed dt is constrained by translational motion, not rotations.
		stiffnesses [contact->getId1()]+=diag_stiffness;
		Rstiffnesses[contact->getId1()]+=diag_Rstiffness*pow(radius1,2);
		stiffnesses [contact->getId2()]+=diag_stiffness;
		Rstiffnesses[contact->getId2()]+=diag_Rstiffness*pow(radius2,2);
	}
}
