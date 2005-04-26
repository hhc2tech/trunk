# File generated by kdevelop's qmake manager. 
# ------------------------------------------- 
# Subdir relative project main directory: ./preprocessors/FileGenerator/BoxStack
# Target is a library:  

LIBS += -lSerialization \
        -lBox \
        -lSphere \
        -lAABB \
        -lMath \
        -lInteraction \
        -lMultiMethods \
        -lInteractionSphere \
        -lInteractionBox \
        -lInteractingGeometrySet2AABBFunctor \
        -lSAPCollider \
        -lRigidBodyParameters \
        -lEngine \
        -lBody \
        -lCundallNonViscousMomentumDampingFunctor \
        -lCundallNonViscousForceDampingFunctor \
        -lSimpleSpringLaw \
        -lActionParameterReset \
        -lActionParameterInitializer \
        -lTranslationCondition \
        -lGravityCondition \
        -rdynamic 
INCLUDEPATH += $(YADEINCLUDEPATH) 
MOC_DIR = $(YADECOMPILATIONPATH) 
UI_DIR = $(YADECOMPILATIONPATH) 
OBJECTS_DIR = $(YADECOMPILATIONPATH) 
QMAKE_LIBDIR = ../../../toolboxes/Libraries/Serialization/$(YADEDYNLIBPATH) \
               ../../../plugins/Body/GeometricalModel/Box/$(YADEDYNLIBPATH) \
               ../../../plugins/Body/GeometricalModel/Sphere/$(YADEDYNLIBPATH) \
               ../../../plugins/Body/BoundingVolume/AABB/$(YADEDYNLIBPATH) \
               ../../../toolboxes/Libraries/Math/$(YADEDYNLIBPATH) \
               ../../../yade/Interaction/Interaction/$(YADEDYNLIBPATH) \
               ../../../toolboxes/Libraries/MultiMethods/$(YADEDYNLIBPATH) \
               ../../../plugins/Body/InteractingGeometry/InteractionSphere/$(YADEDYNLIBPATH) \
               ../../../plugins/Body/InteractingGeometry/InteractionBox/$(YADEDYNLIBPATH) \
               ../../../plugins/Body/BoundingVolumeFunctor/InteractionDescriptionSet2AABBFunctor/$(YADEDYNLIBPATH) \
               ../../../plugins/Interaction/BroadInteractor/SAPCollider/$(YADEDYNLIBPATH) \
               ../../../plugins/Body/BodyPhysicalParameters/RigidBodyParameters/$(YADEDYNLIBPATH) \
               ../../../yade/Engine/$(YADEDYNLIBPATH) \
               ../../../yade/Body/Body/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/ActionParameterFunctor/CundallNonViscousMomentumDampingFunctor/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/ActionParameterFunctor/CundallNonViscousForceDampingFunctor/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/ConstitutiveLaw/SimpleSpringLaw/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/ActionParameterReset/$(YADEDYNLIBPATH) \
               ../../../plugins/Engine/ActionParameterInitializer/$(YADEDYNLIBPATH) \
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
HEADERS += BoxStack.hpp 
SOURCES += BoxStack.cpp 
