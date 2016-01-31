TEMPLATE = app

QT += qml quick svg sql

SOURCES += main.cpp

RESOURCES += qml.qrc

# Change below to your system's path to Qt for Android installation
QML_IMPORT_PATH = /data2/android-devel/Qt5.5.1/5.5/android_armv7/qml/

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
