import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQml 2.12
import QtMultimedia 5.12

Window{
    width: 700
    height: 500
    visible: true

   color: "black"
    title: qsTr("Video Player")


    Rectangle{
        id: display
        width: 680
        height: 300
        border.color: "black"
        border.width: 1
        anchors.horizontalCenter: parent.horizontalCenter
        gradient: Gradient{
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.5; color: "grey" }
        }

        Button{
            id: play
            background: transparent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter


        Text{
            id : fcon
            font.pointSize: 60
            text: qsTr("▶")
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter
        }

        onClicked: {
            img1.source = "Cover.jpg"
            icon.text = "||"
            icon.font.pointSize = 20
            icon.font.bold = 16
        }
}

        Video {
            id: video
            width : 680
            height : 300
            source: "Video/nature.mp4"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                 if (video.playbackState == MediaPlayer.PlayingState){
                     video.pause()
                     play.visible = true
                 }
                else {
                     video.play()
                       play.visible = false
                 }

                }
            }

            focus: true
            Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
            Keys.onLeftPressed: video.seek(video.position - 5000)
            Keys.onRightPressed: video.seek(video.position + 5000)
        }


        ProgressBar{
            id : control
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter
            anchors.verticalCenterOffset : 200



            background: Rectangle{
                id: line
                implicitWidth: 600
                implicitHeight: 10
                color: "darkgrey"
                radius: 2
            }


            contentItem: Item{
                implicitWidth: 200
                implicitHeight: 3


                Repeater {
                                Rectangle {
                                    color: video.duration % 2 ? "steelblue" : "lightsteelblue"
                                    width: 5 ;
                                    height: control.height
                                }
                                model: control.width + 2
                            }
//                            XAnimator on x {
//                                from: 0 ; to: -90

//                                running: control.indeterminate
//                            }
                            NumberAnimation {
                               target: video
                               property: "progress"
                               duration: video.duration
                               easing.type: Easing.InOutQuad
                           }


            }
        }

        Text{
            id: header
            text: qsTr(" Calm Nature (Official Video)")
            font.pointSize : 12
            color: "white"

        }

    }


    Button{
        id : iconStop
        text : qsTr("▶")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter : parent.verticalCenter
        anchors.horizontalCenterOffset : 9
        anchors.verticalCenterOffset : 150
        font.pointSize : 20

        onClicked : {

            if (video.playbackState == MediaPlayer.PlayingState){
                video.pause()
                 iconStop.text ="▶"
                play.visible = true
            }
           else {
                video.play()
                 iconStop.text = "⏸️"
                  play.visible = false
            }

    }
}

    Button{
        id: iconRight
        text : qsTr("⏩")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter : parent.verticalCenter
        anchors.horizontalCenterOffset : 120
        anchors.verticalCenterOffset : 150
        font.pointSize : 20
 onClicked: {
 video.seek(video.position + 5000)}
    }


    Button{
        id: iconLeft
        text : qsTr("⏮")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter : parent.verticalCenter
        anchors.horizontalCenterOffset : -120
        anchors.verticalCenterOffset : 150
        font.pointSize : 20
        onClicked: {
        video.seek(video.position - 5000)
        control.value - 5
        }}
}


