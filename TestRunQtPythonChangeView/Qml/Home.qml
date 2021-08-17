import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
// import QtQuick.Controls.Styles 1.2

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
        width: parent.width 
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
            id: buttonHome
            width: 100
            text: qsTr("Home")

            anchors{
                top: parent.top                    
                left: icon.right     
                leftMargin: 5  
            }
            onPressed: {
                ConHome.changeview("buttonHome")
            }
        }

        Button{
            id: buttonStore
            width: 100
            text: qsTr("Store")

            anchors{
                top: parent.top                    
                left: buttonHome.right     
                leftMargin: 5  
            }
            onPressed: {
                ConHome.changeview("buttonStore")
            }
        }

        AbstractButton{
            id: buttonFriends
            height: 25
            width: 25
            
            anchors{
                top: parent.top                    
                right: parent.right    
                rightMargin: 5  
            }
            icon{
                source: "../Image/user-solid.svg"
                width: parent.width
                height: parent.height
                color: mouseArea.containsMouse ? "#ffffff" : "#212529"
            }
            scale: mouseArea.containsMouse ? 0.8 : 1.0
            smooth: mouseArea.containsMouse

            MouseArea {
                id: mouseArea
                anchors.fill: parent   
                anchors.margins: -10
                hoverEnabled: true             
                onClicked: {
                    console.log("Mouse click pressed"); 
                }                
            }
        }

        Button{
            id: logout
            width: 100
            text: qsTr("Logout")
            
            anchors{
                top: parent.top                    
                right: buttonFriends.right     
                rightMargin: 5  
            }
            onPressed: {
                ConHome.changeview("buttonStore")
            }
        }  

        // Image{
        //     id: buttonFriends
        //     height: 25
        //     width: 25
        //     icon{
        //         source: "../Image/user-solid.svg"
        //         color: mouseArea.containsMouse ? "#ffffff" : "#198754"
        //     }
            
        //     anchors{
        //         top: parent.top                    
        //         right: parent.right    
        //         rightMargin: 5  
        //     }
        //     scale: mouseArea.containsMouse ? 0.8 : 1.0
        //     smooth: mouseArea.containsMouse
            

        //     MouseArea {
        //         id: mouseArea
        //         anchors.fill: parent   
        //         anchors.margins: -10
        //         hoverEnabled: true             
        //         onClicked: {
        //             console.log("Mouse click pressed"); 
        //         }                
        //     }
        // }      
    }   

    Item{
        id:home
        height: parent.height -54
        width: parent.width
        anchors.top: banner.bottom
        visible: true
        Rectangle {
            id: homeBody
            color: "#198754" 
            width: parent.width
            height: parent.height - 82
            anchors{
               left: parent.left
               top: parent.top
            }

            Text{
                text: qsTr("Home")
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
            // 108
            height: 82
            anchors{
                left: parent.left
                top: homeBody.bottom
            }

            Text{
                text: qsTr("Footer home")
                anchors.top: parent.top                    
                anchors.left: parent.left    
                anchors.leftMargin: 5    
                color:"#198754"
            }
        }
    }

    Item{
        id:store
        height: parent.height -54
        width: parent.width
        anchors.top: banner.bottom
        visible: false
        Rectangle {
            id: storeBody
            color: "#198754" 
            width: parent.width
            height: parent.height - 82
            anchors{
               left: parent.left
               top: parent.top
            }

            Text{
                text: qsTr("Store")
                anchors.top: parent.top                    
                anchors.left: parent.left    
                anchors.leftMargin: 5    
                color:"#212529"
            }
        } 

        Rectangle {
            id: storeFooter
            color: "#212529"  
            width: parent.width
            // 108
            height: 82
            anchors{
                left: parent.left
                top: storeBody.bottom
            }

            Text{
                text: qsTr("Footer store")
                anchors.top: parent.top                    
                anchors.left: parent.left    
                anchors.leftMargin: 5    
                color:"#198754"
            }
        }
    }


    Rectangle {
        
        id: friendsList
        color: "#212529"
        visible: true
        width: 20
        // 162
        height: parent.height - 54
        anchors{
            right: parent.right
            top: banner.bottom   
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

        function onViewVisible(viewVisible){
            console.log(viewVisible);
            if(viewVisible == "buttonHome"){
                store.visible = false
                home.visible = true
            } else if(viewVisible == "buttonStore"){
                home.visible = false
                store.visible = true
            }
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

//         function ChangeView(viewIsVisible){
//             console.log(viewIsVisible);
//             view1.visible = !viewIsVisible
//             view2.visible = viewIsVisible
//         }
//     }
// }