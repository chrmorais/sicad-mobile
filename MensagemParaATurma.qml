import QtQuick 2.5
import QtQuick.Controls 1.4

import Material 0.2

Page {
    title: "Mensagem para a Turma"
    Button {
        text: "Mensagem para a Turma!"
        anchors.centerIn: parent

        width: Units.dp(200)
        elevation: 1
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: snackbar.open("That button is wide, and so is this snackbar!")
    }
}
