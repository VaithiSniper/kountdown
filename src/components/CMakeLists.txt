add_library(kountdown-components)

ecm_add_qml_module(kountdown-components
        URI "org.kde.tutorial.components"
)

ecm_target_qml_sources(kountdown-components
        SOURCES
        AddEditDialog.qml
        KountdownDelegate.qml
)

ecm_finalize_qml_module(kountdown-components)

install(TARGETS kountdown-components ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})