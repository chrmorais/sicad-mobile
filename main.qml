import QtQuick 2.5
import QtQuick.Controls 1.4
import Material 0.2
import Material.ListItems 0.1 as ListItem

ApplicationWindow {
    title: "SICAD Mobile"
    width: 640
    height: 480
    visible: true

    theme {
        primaryColor: Palette.colors["green"]["500"]
        accentColor: Palette.colors["green"]["900"]
        tabHighlightColor: Palette.colors["green"]["900"]
    }

    initialPage: page

    Page {
        title: "SICAD Mobile"
        id: page

        actions: [
            Action {
                name: "Notifications"
                iconName: "social/notifications_active"
            },
            Action {
                name: "Settings"
                iconName: "action/account_circle"
                onTriggered: actionSheet.open()
            }
        ]
        backAction: navDrawer.action
        NavigationDrawer {
            id: navDrawer
            enabled: true
            Flickable {
                anchors.fill: parent
                contentHeight: Math.max(content.implicitHeight, height)
                Column {
                    id: content
                    anchors.fill: parent
                    Image {
                        width: parent.width
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/images/sicad-mobile-drawer.png"
                    }
//                    ListItem.Subheader {
//                        text: "Header 1"
//                    }
//                    ListItem.Subtitled {
//                        text: "Title"
//                        subText: "Subtitle"
//                        iconName: "action/input"
//                    }
                    ListItem.Standard {
                        text: "Registro de Aula"
                        iconName: "awesome/calendar_check_o"
                    }
                    ListItem.Standard {
                        text: "Chamada"
                        iconName: "awesome/bullhorn"
                    }
                    ListItem.Standard {
                        text: "Notas"
                        iconName: "social/school"
                    }
                    ListItem.Standard {
                        text: "Turmas"
                        iconName: "awesome/eye"
                    }
                    ListItem.Divider {}
                    ListItem.Standard {
                        text: "Avaliação"
                        iconName: "action/done"
                    }
                    ListItem.Divider {}
                    ListItem.Standard {
                        text: "Mensagem"
                        iconName: "awesome/comment"
                    }
                    ListItem.Divider {}
                    ListItem.Standard {
                        text: "Configurações"
                        iconName: "action/settings"
                    }
//                    ListItem.SimpleMenu {
//                        text: "Menu"
//                        model: ["Option 1", "Option 2", "Option 3"]
//                    }
                }
            }
        }
        BottomActionSheet {
            id: actionSheet

            title: "Demo!"

            actions: [
                Action {
                    iconName: "social/share"
                    name: "Share"
                },

                Action {
                    iconName: "file/file_download"
                    name: "Download (Disabled)"
                    enabled: false
                },

                Action {
                    iconName: "action/autorenew"
                    name: "THIS SHOULD BE HIDDEN"
                    visible: false
                },

                Action {
                    iconName: "action/settings"
                    name: "Details"
                    hasDividerAfter: true
                },

                Action {
                    iconName: "content/forward"
                    name: "Move"
                },

                Action {
                    iconName: "action/delete"
                    name: "Delete"
                },

                Action {
                    iconName: "content/create"
                    name: "Rename"
                }
            ]
        }
        Item {
            anchors.fill: parent
//            Column {
//                anchors.centerIn: parent
//                spacing: Units.dp(20)

//                Button {
//                    text: "Simple Button"
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    onClicked: snackbar.open("Simple, isn't it?")
//                }

//                Button {
//                    text: "Raised Button"
//                    elevation: 1
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    onClicked: snackbar.open("This is a snackbar")
//                }

//                Button {
//                    text: "Disabled Raised Button"
//                    elevation: 1
//                    enabled: false
//                    anchors.horizontalCenter: parent.horizontalCenter
//                }

//                Button {
//                    text: "Wide Button"

//                    width: Units.dp(200)
//                    elevation: 1
//                    anchors.horizontalCenter: parent.horizontalCenter

//                    onClicked: snackbar.open("That button is wide, and so is this snackbar!")
//                }

//                Button {
//                    id: focusableButton
//                    text: "Focusable with really long text"
//                    elevation: 1
//                    activeFocusOnPress: true
//                    anchors.horizontalCenter: parent.horizontalCenter

//                    onClicked: snackbar.open("The text is really very very very very very long and now it needs to wrap, so this should show as two lines!")
//                }

//                Button {
//                    text: "Colored button"
//                    textColor: Theme.accentColor
//                    anchors.horizontalCenter: parent.horizontalCenter

//                    onClicked: snackbar.open("That button is colored!")
//                }

//                Button {
//                    text: "Focusable button #2"
//                    elevation: 1
//                    activeFocusOnPress: true
//                    backgroundColor: Theme.primaryColor
//                    anchors.horizontalCenter: parent.horizontalCenter

//                    onClicked: snackbar.open("That button is colored!")
//                }
//            }

            ActionButton {
                anchors {
                    right: parent.right
                    bottom: snackbar.top
                    margins: Units.dp(32)
                }

                action: Action {
                    id: addContent
                    text: "&Copy"
                    shortcut: "Ctrl+C"
                    onTriggered: snackbar.open("We do actions too!")
                }
                iconName: "content/add"
            }

            Snackbar {
                id: snackbar
            }
        }
    }
}
