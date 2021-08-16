import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow{
    id: window
    // minimumHeight: 600
    // minimumWidth: 1120
    // maximumHeight: 600
    // maximumWidth: 1120
    height: 600
    width: 1120
    visible: true
    title: qsTr("Home Page")

    color: "#198754"    

    Rectangle {
        id: banner
        width: parent.width - 240
        height: 54
        anchors{
            left: parent.left
            top: parent.top
        }
        color: "#212529"
                    
        Text{
            id: icon
            text: qsTr("LOR")     
            font.pointSize: parent.height * .5        
            // font.family: "Sans"
            anchors{
                top: parent.top                    
                left: parent.left    
                leftMargin: 5  
            }
            color: "#198754"    
        }

        Button{
            width: 50
            text: qsTr("change view")
            clip: true

            anchors{
                top: parent.top                    
                left: icon.right     
                leftMargin: 5  
            }
            onPressed: {
                console.log(buttonLogin.focus);
                ConHome.changeview(buttonLogin.focus)
            }
        }
    }   

    Item{
        id:home
        height: parent.height -54
        width: parent.width - 240
        anchors.top: banner.bottom
        Rectangle {
            id: homeBody
            color: "#198754" 
            width: parent.width
            height: parent.height - 108
            anchors{
               left: parent.left
               top: parent.top
            }

            Text{
                text: qsTr("Feed")
                anchors.top: parent.top                    
                anchors.left: parent.left    
                anchors.leftMargin: 5    
                color:"#212529"
            }
        } 

        Rectangle {
            id: homeFooter
            color: "#212529"  
            width: parent.width
            height: 108
            anchors{
                left: parent.left
                top: body.bottom
            }

            Text{
                text: qsTr("Footer")
                anchors.top: parent.top                    
                anchors.left: parent.left    
                anchors.leftMargin: 5    
                color:"#198754"
            }
        }
    }

    Item{
        id:store
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





    Rectangle {
        
        id: friendsList
        color: "#212529"
        visible: true
        width: 20
        height: parent.height
        anchors{
            right: parent.right
            top: parent.top   
        }
        
        PropertyAnimation { 
            id: animationSlideMenuIn;
            target: friendsList;
            property: "width";
            to: 240;
            duration: 200
        }

        PropertyAnimation { 
            id: animationSlideMenuOut;
            target: friendsList;
            property: "width";
            to: 20;
            duration: 200
        }
        
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onPressed:{
                if (friendsList.width == 20) {
                    animationSlideMenuIn.running = true
                } else {
                    animationSlideMenuOut.running = true
                }   
                
            }
            
        }

        Item{

        }

        Text{
            text: qsTr("User")
            anchors.top: parent.top                    
            anchors.left: parent.left    
            anchors.leftMargin: 5    
            color:"#198754"
        }
    }

    Connections{
        target: ConHome

        function onViewIsVisible(viewIsVisible){
            console.log(viewIsVisible);
            home.visible = !viewIsVisible
            store.visible = viewIsVisible
        }
    }
}


//     Button{
//         id:buttonLogin
//         width: 300
//         text: qsTr("change view")
//         checked: true
//         anchors.top: topBar.bottom
//         anchors.topMargin: 10
//         anchors.horizontalCenter: parent.horizontalCenter
//         onPressed: {
//             console.log(buttonLogin.checked);
//             ConHome.changeview(buttonLogin.checked)
//         }
//     }

//     Item{
//         id:view1
//         anchors.topMargin: 10
//         anchors.horizontalCenter: parent.horizontalCenter
//         anchors.top: buttonLogin.bottom
//         Rectangle{
//             id:gameview
//             width: 100
//             height: 100
            
//             color: Material.color(Material.red)
//         }
//     }

//     Item{
//         id:view2
//         anchors.topMargin: 10
//         anchors.horizontalCenter: parent.horizontalCenter
//         anchors.top: buttonLogin.bottom
//         visible: false
//         Rectangle{
//             id: storeview
//             width: 100
//             height: 100
//             color: Material.color(Material.Blue)
//         }
//     }    

//     Connections{
//         target: ConHome

//         function onViewIsVisible(viewIsVisible){
//             console.log(viewIsVisible);
//             view1.visible = !viewIsVisible
//             view2.visible = viewIsVisible
//         }
//     }
// }