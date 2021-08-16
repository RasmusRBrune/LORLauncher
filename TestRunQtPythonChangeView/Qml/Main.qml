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
    MouseArea {
        anchors.fill: parent

        onClicked: {
            buttonLogin.focus = true
        }
    }


    flags: Qt.WindowCloseButtonHint | Qt.WindowMinmizeButtinHint | Qt.CustomizeWindowHint | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint

    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

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
        Keys.onPressed: {
            if (event.key == Qt.Key_Return) {
                console.log("Key Enter was pressed");
                event.accepted = true;
                ConMain.login(usernameField.text, passwordField.text, buttonLogin.checked)
            }
        }
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
        Keys.onPressed: {
            if (event.key == Qt.Key_Return) {
                console.log("Key Enter was pressed");
                event.accepted = true;
                ConMain.login(usernameField.text, passwordField.text, buttonLogin.checked)
            }
        }
    }

    CheckBox{
        id: checkBox
        text: qsTr("Save your password")
        anchors.top: passwordField.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        Keys.onPressed: {
            if (event.key == Qt.Key_Return) {
                console.log("Key Enter was pressed");
                event.accepted = true;
                ConMain.login(usernameField.text, passwordField.text, buttonLogin.checked)
            }
        }
    }

    Button{
        id:buttonLogin
        width: 300
        focus: true
        checked: false
        text: qsTr("Login")
        anchors.top: checkBox.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        Keys.onPressed: {
            if (event.key == Qt.Key_Return) {
                console.log("Key Enter was pressed");
                event.accepted = true;
                ConMain.login(usernameField.text, passwordField.text, buttonLogin.checked)
            }
            if (event.key == Qt.Key_Space) {
                console.log("Key Space was pressed");  
            }
        }
        // onPressed: {    
        //     console.log("Error");                       
        //     //ConMain.login(usernameField.text, passwordField.text, buttonLogin.checked)
        // }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                console.log("Mouse click pressed"); 
            }
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
            ConMain.changetohome(buttonTestForPythonCode.checked)
        }
    }

    Connections{
        target: ConMain

        function onIsVisible(isVisible){
            window.visible = isVisible
        }
    }
}
