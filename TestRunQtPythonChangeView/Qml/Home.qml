import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15


ApplicationWindow{
    id: window
    height: 760
    width: 500
    visible: true
    title: qsTr("Home Page")

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
            text: qsTr("home page")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }
    }

    Button{
        id:buttonLogin
        width: 300
        text: qsTr("change view")
        checked: true
        anchors.top: topBar.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        onPressed: {
            console.log(buttonLogin.checked);
            Con.changeview(buttonLogin.checked)
        }
    }

    Item{
        id:view1
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: buttonLogin.bottom
        Rectangle{
            id:gameview
            width: 100
            height: 100
            
            color: Material.color(Material.red)
        }
    }

    Item{
        id:view2
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: buttonLogin.bottom
        visible: false
        Rectangle{
            id: storeview
            width: 100
            height: 100
            color: Material.color(Material.Blue)
        }
    }    

    Connections{
        target: Con

        function onViewIsVisible(viewIsVisible){
            console.log(viewIsVisible);
            view1.visible = !viewIsVisible
            view2.visible = viewIsVisible
        }
    }
}