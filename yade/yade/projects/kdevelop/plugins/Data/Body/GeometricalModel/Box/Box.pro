# File generated by kdevelop's qmake manager. 
# ------------------------------------------- 
# Subdir relative project main directory: ./plugins/Data/Body/GeometricalModel/Box
# Target is a library:  

LIBS += -lyade-lib-wm3-math \
        -lyade-lib-multimethods \
        -lyade-lib-serialization \
        -rdynamic 
INCLUDEPATH = $(YADEINCLUDEPATH) 
MOC_DIR = $(YADECOMPILATIONPATH) 
UI_DIR = $(YADECOMPILATIONPATH) 
OBJECTS_DIR = $(YADECOMPILATIONPATH) 
QMAKE_LIBDIR = ../../../../../libraries/yade-lib-wm3-math/$(YADEDYNLIBPATH) \
               ../../../../../libraries/yade-lib-multimethods/$(YADEDYNLIBPATH) \
               ../../../../../libraries/yade-lib-serialization/$(YADEDYNLIBPATH) \
               ../../../../../toolboxes/Libraries/yade-lib-wm3-math/$(YADEDYNLIBPATH) \
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
HEADERS += Box.hpp 
SOURCES += Box.cpp 
