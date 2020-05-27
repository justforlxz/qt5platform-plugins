#-------------------------------------------------
#
# Project created by QtCreator 2020-04-29T13:23:01
#
#-------------------------------------------------

QT       += KWaylandClient
CONFIG += link_pkgconfig plugin

# Qt >= 5.8
greaterThan(QT_MINOR_VERSION, 7): QT += gui-private
else: QT += platformsupport-private

# Qt >= 5.10
greaterThan(QT_MINOR_VERSION, 9): QT += edid_support-private

greaterThan(QT_MINOR_VERSION, 4): LIBS += -lQt5XcbQpa

TARGET = dwayland
TEMPLATE = lib

DESTDIR = $$_PRO_FILE_PWD_/../../bin/plugins/platforms

DEFINES += QT5DWAYLANDPLUGIN_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

isEmpty(VERSION) {
    isEmpty(VERSION): VERSION = $$system(git describe --tags --abbrev=0)
    VERSION = $$replace(VERSION, [^0-9.],)
    isEmpty(VERSION): VERSION = 1.1.11
}

DEFINES += WAYLAND_VERSION=\\\"$$VERSION\\\"

SOURCES += \
        $$PWD/dplatformnativeinterfacehook.cpp \
        $$PWD/../../src/vtablehook.cpp \
        $$PWD/../../xcb/dnativesettings.cpp \
        $$PWD/../../xcb/dxcbxsettings.cpp \
        $$PWD/../../xcb/utility_x11.cpp \
        $$PWD/main.cpp

HEADERS += \
        $$PWD/dplatformnativeinterfacehook.h \
        $$PWD/../../xcb/utility.h \
        $$PWD/../../xcb/dxcbxsettings.h \
        $$PWD/../../xcb/dnativesettings.h

INCLUDEPATH += $$PWD/../qtwayland-dev \
               $$PWD/../../src \
               $$PWD/../../xcb \
               $$PWD/../../xcb/libqt5xcbqpa-dev/5.11.3

OTHER_FILES += \
    dwayland.json

isEmpty(INSTALL_PATH) {
    target.path = $$[QT_INSTALL_PLUGINS]/platforms
} else {
    target.path = $$INSTALL_PATH
}

INSTALLS += target
