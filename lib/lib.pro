QT += core \
    widgets \
    concurrent \
    network

TARGET = QtInspector

TEMPLATE = lib

LIBS += -lprotobuf

SOURCES += DirectObjectProxy.cpp \
    DirectWidgetPicker.cpp \
    InspectorServer.cpp \
    libmain.cpp \
    NetstringReader.cpp \
    NetstringWriter.cpp \
    ObjectIdMap.cpp \
    PlatformUtils.cpp \
    StartupHelper.cpp \
    VariantSerializer.cpp \
    WidgetPicker.cpp

HEADERS += DirectObjectProxy.h \
    DirectWidgetPicker.h \
    InspectorServer.h \
    NetstringReader.h \
    NetstringWriter.h \
    ObjectIdMap.h \
    ObjectProxy.h \
    PlatformUtils.h \
    StartupHelper.h \
    VariantSerializer.h \
    WidgetPicker.h

OBJECTS_DIR = .tmplib
MOC_DIR = .tmplib
RCC_DIR = .tmplib

QMAKE_CXXFLAGS += -Werror

PROTOS += inspector.proto

PROTOPATH += .
PROTOPATHS =
for(p, PROTOPATH):PROTOPATHS += --proto_path=$${p}

protobuf_decl.name = protobuf headers
protobuf_decl.input = PROTOS
protobuf_decl.output = ${QMAKE_FILE_IN_PATH}/${QMAKE_FILE_BASE}.pb.h
protobuf_decl.commands = protoc --cpp_out=${QMAKE_FILE_IN_PATH} --proto_path=${QMAKE_FILE_IN_PATH} ${QMAKE_FILE_NAME}
protobuf_decl.variable_out = HEADERS
QMAKE_EXTRA_COMPILERS += protobuf_decl

protobuf_impl.name = protobuf sources
protobuf_impl.input = PROTOS
protobuf_impl.output = ${QMAKE_FILE_IN_PATH}/${QMAKE_FILE_BASE}.pb.cc
protobuf_impl.depends = ${QMAKE_FILE_IN_PATH}/${QMAKE_FILE_BASE}.pb.h
protobuf_impl.commands = $$escape_expand(\n)
protobuf_impl.variable_out = SOURCES
QMAKE_EXTRA_COMPILERS += protobuf_impl
