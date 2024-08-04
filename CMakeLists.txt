    cmake_minimum_required(VERSION 3.20)
    project(kountdown)


    if(NOT CMAKE_BUILD_TYPE)
        set(CMAKE_BUILD_TYPE Debug)
    endif()

    find_package(ECM 6.0.0 REQUIRED NO_MODULE)
    set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

    include(KDEInstallDirs)
    include(KDECMakeSettings)
    include(KDECompilerSettings NO_POLICY_SCOPE)
    include(ECMFindQmlModule)
    include(ECMQmlModule)

    find_package(Qt6 REQUIRED COMPONENTS
    Core
    Quick
    Test
    Gui
    QuickControls2
    Widgets
    )

    find_package(KF6 REQUIRED COMPONENTS
    Kirigami
    I18n
    CoreAddons
    )

    # Explicitly set QML import paths
    list(APPEND QML_IMPORT_PATHS "/usr/lib/qt6/qml")
    set(QML_IMPORT_PATH "${QML_IMPORT_PATHS}" CACHE STRING "Qt Creator extra qml import paths")

    # Manually set KDE_INSTALL_FULL_QMLDIR
    set(KDE_INSTALL_FULL_QMLDIR "/usr/lib/qt6/qml")

    add_subdirectory(src)

    install(PROGRAMS org.kde.tutorial.desktop DESTINATION ${KDE_INSTALL_APPDIR})

    feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
