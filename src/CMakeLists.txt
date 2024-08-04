add_executable(kountdown)

# Include the resource file
qt_add_resources(kountdown "resources"
        PREFIX "/"
        FILES
        resources.qrc
)

ecm_add_qml_module(kountdown
        URI "org.kde.tutorial"
)

ecm_target_qml_sources(kountdown
        SOURCES
        Main.qml
)

target_sources(kountdown
        PRIVATE
        main.cpp
)

target_link_libraries(kountdown
        PRIVATE
        Qt6::Quick
        Qt6::Qml
        Qt6::Gui
        Qt6::QuickControls2
        Qt6::Widgets
        KF6::I18n
        KF6::CoreAddons
        KF6::Kirigami
        kountdown-components
)

install(TARGETS kountdown ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})

add_subdirectory(components)