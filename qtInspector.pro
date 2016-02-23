QT += core \
    widgets \
    gui \
    network

TARGET = qtInspector

TEMPLATE = app

LIBS += -lprotobuf -Llib -lQtInspector

SOURCES += ExternalObjectProxy.cpp \
    ExternalWidgetPicker.cpp \
    GdbLibraryInjector.cpp \
    main.cpp \
    ObjectFilter.cpp \
    ObjectInspector.cpp \
    ObjectPropertyModel.cpp \
    ObjectTreeModel.cpp \
    OutOfProcessClipboard.cpp \
    PreloadInjector.cpp \
    TargetApplicationProxy.cpp \
    WidgetInspector.cpp \
    WidgetInspectorShortcut.cpp

HEADERS += ExternalObjectProxy.h \
    ExternalWidgetPicker.h \
    GdbLibraryInjector.h \
    Injector.h \
    libQtInspectorExport.h \
    ObjectFilter.h \
    ObjectInspector.h \
    ObjectPropertyModel.h \
    ObjectTreeModel.h \
    OutOfProcessClipboard.h \
    PreloadInjector.h \
    RootObjectList.h \
    TargetApplicationProxy.h \
    WidgetInspector.h \
    WidgetInspectorShortcut.h

OBJECTS_DIR = .tmpapp
MOC_DIR = .tmpapp
RCC_DIR = .tmpapp

QMAKE_CXXFLAGS += -Werror
