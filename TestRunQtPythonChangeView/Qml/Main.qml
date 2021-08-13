import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15




ApplicationWindow{
    id: window
    height: 580
    width: 400
    visible: true
    title: qsTr("login Page")


    flags: Qt.WindowCloseButtonHint | Qt.WindowMinmizeButtinHint | Qt.CustomizeWindowHint | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint

    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    QtObject {
        id: internal
        property string user: "Ras"
        property string pass: "123"

        function checkLogin(username, password) {
            if(username === user && password === pass){
                var component = Qt.createComponent("Home.qml")
                var win = component.createObject()
                win.show()
                visible = false
            } else{

                if(username !== user){
                    usernameField.Material.foreground = Material.Pink
                    usernameField.Material.accent = Material.Pink
                } else {
                    usernameField.Material.foreground = Material.LightBlue
                    usernameField.Material.accent = Material.LightBlue
                }

                if(password !== pass){
                    passwordField.Material.foreground = Material.Pink
                    passwordField.Material.accent = Material.Pink
                } else {
                    passwordField.Material.foreground = Material.LightBlue
                    passwordField.Material.accent = Material.LightBlue
                }
            }
        }
    }

    Rectangle {
        id: topBar
        height: 40
        color: Material.color(Material.Blue)
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            margins: 10
        }
        radius: 10

        Text {
            text: qsTr("Login page")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }
    }
    

    Image{
        id: image
        width: 300
        height: 120
        source: "../Image/Logo.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: topBar.bottom
        anchors.topMargin: 60 
    }

    TextField{
        id:usernameField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Your username")
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: image.bottom
        anchors.topMargin: 60
    }

    TextField{
        id:passwordField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Your password")
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: usernameField.bottom
        anchors.topMargin: 10
        echoMode: TextInput.Password
    }

    CheckBox{
        id: checkBox
        text: qsTr("Save your password")
        anchors.top: passwordField.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button{
        id:buttonLogin
        width: 300
        text: qsTr("Login")
        anchors.top: checkBox.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        onPressed: {
            ConMain.checkLogin(usernameField.text, passwordField.text)
        }
    }

    Button{
        //signal callPython()
        id:buttonTestForPythonCode
        width: 300
        checked: false
        text: qsTr("callpython")
        anchors.top: buttonLogin.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        onPressed: {
            ConMain.on_qml_mouse_clicked()
            ConMain.closewindow(buttonTestForPythonCode.checked)
        }
    }

    Connections{
        target: ConMain

        function onIsVisible(isVisible){
            window.visible = isVisible
        }
    }
}
