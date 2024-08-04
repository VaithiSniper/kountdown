import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami

// Using an AbstractCard to represent each kountdown
Kirigami.AbstractCard {
    contentItem: Item {
        implicitHeight: delegateLayout.implicitHeight
        implicitWidth: delegateLayout.implicitWidth

        // Idea of how the GridLayout is going to be within this card
        GridLayout {
            id: delegateLayout

            columnSpacing: Kirigami.Units.gridUnit
            columns: root.wideScreen ? 4 : 2
            rowSpacing: Kirigami.Units.gridUnit

            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }

            // Overall heading for that card will be the remaining time
            Kirigami.Heading {
                Layout.columnSpan: root.wideScreen ? 1 : 2
                color: "#ffffff"
                font.family: "Space Grotesk"
                font.pointSize: 14
                level: 1
                text: i18n("%1 days", Math.round((date - Date.now()) / 86400000))
            }

            // Each element info, the name and the description along a column with a Separator
            ColumnLayout {
                Kirigami.Heading {
                    Layout.fillWidth: true
                    font.family: "Unbounded"
                    level: 2
                    text: name
                }
                Kirigami.Separator {
                    Layout.fillWidth: true
                    visible: description.length > 0
                }
                Controls.Label {
                    Layout.fillWidth: true
                    font.family: "Inter"
                    text: description
                    visible: description.length > 0
                    wrapMode: Text.WordWrap
                }
            }
            ColumnLayout {
                Layout.alignment: Qt.AlignRight
                Layout.columnSpan: 2

                // Button in the AbstractCard
                Controls.Button {
                    text: i18n("Edit")

                    onClicked: setModalAndOpen("edit", index);
                }
                // Button in the AbstractCard
                Controls.Button {
                    text: i18n("Delete")

                    onClicked: kountdownModel.remove(index)
                }
            }
        }
        // End of ColumnLayout
    }
    // End of AbstractCard
}
