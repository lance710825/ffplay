TEMPLATE = app

TARGET = ffplay

DESTDIR = $$PWD/bin
CONFIG -= qt
CONFIG += console

#!build_pass:message($$PWD)
INCLUDEPATH += $$PWD/../ffmpeg/build32/include
INCLUDEPATH += $$PWD/../SDL/include
#SDL & SDL2 library
LIBS += -L$$PWD/../SDL/lib
LIBS += -lSDL2 -lSDL2main -lSDL2test
#ffmpeg library
LIBS += -L$$PWD/../ffmpeg/build32/bin
LIBS += -lavcodec -lavdevice -lavfilter -lavformat -lavutil -lswresample -lswscale# -lpostproc
#LIBS += -llegacy_stdio_definitions

#CONFIG-= windows
#QMAKE_LFLAGS += $$QMAKE_LFLAGS_WINDOWS
#win32: {
QMAKE_LIBS_QT_ENGTRY -= -lqtmain
#DEFINES -= QT_NEEDS_QMAIN
#}

SOURCES += \
    $$PWD/ffplay/ffplay.c \
    ffplay/cmdutils.c

HEADERS += \
    ffplay/cmdutils.h \
    ffplay/config.h