# File generated by kdevelop's qmake manager. 
# ------------------------------------------- 
# Subdir relative project main directory: ./preprocessors/FileGenerator/FEMBeam
# Target is a library:  

LIBS += -lAABB \
        -lBox \
        -lPolyhedron \
        -lRigidBodyParameters \
        -lCundallNonViscousMomentumDamping \
        -lCundallNonViscousForceDamping \
        -lSphere \
        -lFEMSetParameters \
        -lFEMTetrahedronData \
        -lFEMNodeData \
        -lTetrahedron \
        -lFEMSetTextLoader \
        -lFEMLaw \
        -lFEMTetrahedronStiffness \
        -lMetaInteractingGeometry \
        -lGravityEngine \
        -lTranslationEngine \
        -lyade-lib-serialization \
        -lyade-lib-wm3-math \
        -lyade-lib-multimethods \
        -lPhysicalActionVectorVector \
        -lInteractionVecSet \
        -lBodyRedirectionVector \
        -lPhysicalActionContainerInitializer \
        -lPhysicalActionContainerReseter \
        -lInteractionGeometryMetaEngine \
        -lInteractionPhysicsMetaEngine \
        -lGeometricalModelMetaEngine \
        -lPhysicalActionApplier \
        -lPhysicalParametersMetaEngine \
        -lBoundingVolumeMetaEngine \
        -rdynamic 
INCLUDEPATH = $(YADEINCLUDEPATH) 
MOC_DIR = $(YADECOMPILATIONPATH) 
UI_DIR = $(YADECOMPILATIONPATH) 
OBJECTS_DIR = $(YADECOMPILATIONPATH) 
QMAKE_LIBDIR = ../../../plugins/Data/Body/BoundingVolume/AABB/$(YADEDYNLIBPATH) \
               ../../../plugins/Data/Body/GeometricalModel/Box/$(YADEDYNLIBPATH) \
               ../../../plugins/Data/Body/GeometricalModel/Polyhedron/$(YADEDYNLIBPATH) \
               ../../../plugins/Data/Body/PhysicalParameters/RigidBodyParameters/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/EngineUnit/PhysicalActionEngineUnit/CundallNonViscousMomentumDamping/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/EngineUnit/PhysicalActionEngineUnit/CundallNonViscousForceDamping/$(YADEDYNLIBPATH) \
               ../../../plugins/Data/Body/GeometricalModel/Sphere/$(YADEDYNLIBPATH) \
               ../../../plugins/Data/Body/PhysicalParameters/FEMSetParameters/$(YADEDYNLIBPATH) \
               ../../../plugins/Data/Body/PhysicalParameters/FEMTetrahedronData/$(YADEDYNLIBPATH) \
               ../../../plugins/Data/Body/PhysicalParameters/FEMNodeData/$(YADEDYNLIBPATH) \
               ../../../plugins/Data/Body/GeometricalModel/Tetrahedron/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/EngineUnit/BodyEngineUnit/PhysicalParametersEngineUnit/FEMSetTextLoader/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/Engine/PhysicalActionEngine/InteractionSolver/FEMLaw/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/EngineUnit/BodyEngineUnit/PhysicalParametersEngineUnit/FEMTetrahedronStiffness/$(YADEDYNLIBPATH) \
               ../../../plugins/Data/Body/InteractingGeometry/MetaInteractingGeometry/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/DeusExMachina/GravityEngine/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/DeusExMachina/TranslationEngine/$(YADEDYNLIBPATH) \
               ../../../libraries/yade-lib-serialization/$(YADEDYNLIBPATH) \
               ../../../libraries/yade-lib-wm3-math/$(YADEDYNLIBPATH) \
               ../../../libraries/yade-lib-multimethods/$(YADEDYNLIBPATH) \
               ../../../plugins/Container/PhysicalActionContainer/PhysicalActionVectorVector/$(YADEDYNLIBPATH) \
               ../../../plugins/Container/InteractionContainer/InteractionVecSet/$(YADEDYNLIBPATH) \
               ../../../plugins/Container/BodyContainer/BodyRedirectionVector/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/Engine/PhysicalActionEngine/PhysicalActionContainerInitializer/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/Engine/PhysicalActionEngine/PhysicalActionContainerReseter/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/MetaEngine/InteractionMetaEngine/NarrowInteractionGeometryMetaEngine/InteractionGeometryMetaEngine/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/MetaEngine/InteractionMetaEngine/InteractionPhysicsMetaEngine/InteractionPhysicsMetaEngine/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/MetaEngine/BodyMetaEngine/GeometricalModelMetaEngine/GeometricalModelMetaEngine/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/MetaEngine/PhysicalActionMetaEngine/PhysicalActionApplier/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/MetaEngine/BodyMetaEngine/PhysicalParameterMetaEngine/PhysicalParametersMetaEngine/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/MetaEngine/BodyMetaEngine/BoundingVolumeMetaEngine/BoundingVolumeMetaEngine/$(YADEDYNLIBPATH) \
               $(YADEDYNLIBPATH) 
QMAKE_CXXFLAGS_RELEASE += -lpthread \
                          -pthread 
QMAKE_CXXFLAGS_DEBUG += -lpthread \
                        -pthread 
DESTDIR = $(YADEDYNLIBPATH) 
CONFIG += debug \
          warn_on \
          dll 
TEMPLATE = lib 
HEADERS += FEMBeam.hpp 
SOURCES += FEMBeam.cpp 
