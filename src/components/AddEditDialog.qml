import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami


// Using an dialog box to add each kountdown
Kirigami.Dialog {
    id: addDialog

    property string mode: "create"
    property int index: -1
    property string name: ""
    property string description: ""
    property string date: ""

    // To append a new kountdown to the model
    function appendDataToModel() {
        kountdownModel.append({
            name: nameField.text,
            description: descriptionField.text,
            date: Date.parse(new Date(dateField.text))
        });
    }

    // To set an existing kountdown to the model
    function setDataToModel(index) {
        kountdownModel.set(index, {
            name: nameField.text,
            description: descriptionField.text,
            date: Date.parse(new Date(dateField.text))
        });
    }

    // Form validation function
    function requiredFieldsFilled() {
        return (nameField.text !== "" && dateField.acceptableInput);
    }

    // To reset the form and close the dialog
    function resetModalAndClose() {
        addDialog.name = "";
        addDialog.description = "";
        addDialog.date = "";
        addDialog.close();
    }

    // Dialog properties
    padding: Kirigami.Units.gridUnit
    preferredWidth: Kirigami.Units.gridUnit * 20
    standardButtons: Kirigami.Dialog.Ok | Kirigami.Dialog.Cancel
    title: i18nc("@title:window", "Add kountdown")

    // Lifecycle methods
    // onMount equivalent
    Component.onCompleted: {
        const button = standardButton(Kirigami.Dialog.Ok);
        button.enabled = Qt.binding(() => (requiredFieldsFilled()));
        nameField.text = addDialog.name;
        descriptionField.text = addDialog.description;
        dateField.text = addDialog.date;
    }
    // onSubmit equivalent
    onAccepted: {
        if (!addDialog.requiredFieldsFilled()) return;
        if (addDialog.mode === "create")
            appendDataToModel();
        else if (addDialog.mode === "edit")
            setDataToModel(addDialog.index);
        resetModalAndClose();
    }

    // Form layout in the dialog box
    Kirigami.FormLayout {
        Controls.TextField {
            id: nameField

            Kirigami.FormData.label: i18nc("@label:textbox", "Name* :")

            onAccepted: descriptionField.forceActiveFocus()
        }
        Controls.TextField {
            id: descriptionField

            Kirigami.FormData.label: i18nc("@label:textbox", "Description :")
            placeholderText: i18nc("@placeholder:textbox", "Optional")

            onAccepted: dateField.forceActiveFocus()
        }
        Controls.TextField {
            id: dateField

            Kirigami.FormData.label: i18nc("@label:textbox", "ISO Date* :")
            inputMask: "D999-99-99"

            onAccepted: addDialog.onAccepted()
        }
        Controls.Label {
            text: "* = required fields"
        }
    }
}
