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

    property var sections: [
        { name: "Registrar Aula", source: "RegistrarAula.qml", icon: "awesome/calendar_check_o" },
        { name: "Realizar Chamada", source: "RealizarChamada.qml", icon: "awesome/bullhorn" },
        { name: "Lançar Notas", source: "LancarNotas.qml", icon: "social/school" },
        { name: "Visualizar Turma", source: "VisualizarTurma.qml", icon: "awesome/eye" },
        { name: "Avaliação Institucional", source: "AvaliacaoInstitucional.qml", icon: "action/done" },
        { name: "Mensagem para a Turma", source: "MensagemParaATurma.qml", icon: "awesome/comment" },
        { name: "Configurações", source: "Configuracoes.qml", icon: "action/settings" }
    ]

    property var selectedSection

    initialPage: page

    Page {
//        title: "SICAD Mobile"
        title: fromdb

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
            width: Units.dp(275)

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
                    Repeater {
                        model: sections
                        ListItem.Standard {
                            text: modelData.name
                            iconName: modelData.icon
                            selected: (selectedSection !== undefined) ? (selectedSection.name === text):false
                            onClicked: {
                                //selectedSection = modelData
                                pageStack.push(Qt.resolvedUrl(modelData.source))
                                navDrawer.close()
                            }
                        }
                    }
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

            Flickable {
                id: flickable
                anchors.fill: parent
                clip: true
                contentHeight: Math.max(example.implicitHeight + 40, height)
                Loader {
                    id: example
                    anchors.fill: parent
                    asynchronous: true
                    visible: status == Loader.Ready
                    source: (selectedSection !== undefined) ? Qt.resolvedUrl(selectedSection.source):""
                }
                ProgressCircle {
                    anchors.centerIn: parent
                    visible: example.status == Loader.Loading
                }
            }
            Scrollbar {
                flickableItem: flickable
            }
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
