import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
import org.kde.tutorial.components

Kirigami.ApplicationWindow {
    id: root

    flags: Qt.WA_TranslucentBackground
    height: 600
    title: i18nc("@title:window", "Kountdown")
    width: 800

    // To set the form values for edit
    function setModalAndOpen(mode = "create", index = -1) {
        addEditDialog.mode = mode;
        addEditDialog.index = index;
        if (mode === "edit") {
            const data = kountdownModel.get(index);
            addEditDialog.name = data.name;
            addEditDialog.description = data.description;
            addEditDialog.date = data.date;
        }
        addEditDialog.open();
    }

    globalDrawer: Kirigami.GlobalDrawer
    {
        isMenu: true

        actions: [
            Kirigami.Action {
                id: quitApp

                icon.name
        :
        "gtk-quit"
        shortcut: StandardKey.Quit
        text: i18nc("@action:button", "Quit")

        onTriggered: Qt.quit()
    }
        ]
    }
    pageStack.initialPage: Kirigami.ScrollablePage
    {
        title: i18nc("@title", "Kountdown")

        actions: [
            Kirigami.Action {
                id: addAction
                icon.name
        :
        "list-add"
        text: i18nc("@action:button", "Add kountdown")
        onTriggered: setModalAndOpen("create")
    },
        Kirigami.Action {
            id: deleteAll

            icon.name: "edit-delete"
            text: i18nc("@action:button", "Delete All")

            onTriggered: kountdownModel.count > 0 && kountdownModel.remove(0, kountdownModel.count)
        }
        ]

        Kirigami.CardsListView {
            id: cardsView

            model: kountdownModel

            delegate: KountdownDelegate {
            }
        }
    }

    ListModel {
        id: kountdownModel

    }
    AddEditDialog {
        id: addEditDialog

    }
}
