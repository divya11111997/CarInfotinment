import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:window_m
    width: 640
    height: 480
    visible: true

    Image {
        id: windowBGimg
        anchors.centerIn: window_m
        width: window_m.width
        height: window_m.height
        fillMode: name.PreserveAspectCrop
        //fillMode: name.PreserveAspectFit
        source: "file:///C:/Users/Admin/Desktop/workshop_interview/abstract_background_12.jpg"
    }

    Flow {
        id: root
        // width: window_m.width
        // height:window_m.height
        anchors.centerIn: parent // Center the Flow within the Window
        spacing : 5
      //  cellWidth: 100
      //  cellHeight: 100



        add: Transition {
            NumberAnimation {
                properties: "x,y"
                easing.type: Easing.OutQuad
            }
        }

    //! [0]
        Repeater{
        model: DelegateModel {
    //! [0]
            id: visualModel
            model: ListModel {
                    ListElement { width_w: 100; height_h: 100;imageSource: "file:///C:/Users/Admin/Desktop/workshop_interview/music_14363309.png" }
                    ListElement { width_w: 100; height_h: 100;imageSource: "file:///C:/Users/Admin/Desktop/workshop_interview/compass_10308529.png" }
                    ListElement { width_w: 100; height_h: 100;imageSource: "file:///C:/Users/Admin/Desktop/workshop_interview/bluetooth_8918161.png" }
                    ListElement { width_w: 100; height_h: 100 ;imageSource:"file:///C:/Users/Admin/Desktop/workshop_interview/cloud_16367420.png"}
                    ListElement { width_w: 100; height_h: 100 ;imageSource:"file:///C:/Users/Admin/Desktop/workshop_interview/gear_8419726.png"}
                    ListElement { width_w: 100; height_h: 100; imageSource: "file:///C:/Users/Admin/Desktop/workshop_interview/webcam_7739101.png" }
                    ListElement { color: "cyan" }
                    ListElement { color: "magenta" }
                    ListElement { color: "chartreuse" }
                }

            delegate: DropArea {
                id: delegateRoot
                required property color color
                required property int width_w
                required property int height_h
                required property string imageSource
                width: width_w
                height: height_h

                onEntered: function(drag) {
                    visualModel.items.move((drag.source as Rectangle).visualIndex, icon.visualIndex)
                }

                property int visualIndex: DelegateModel.itemsIndex

                Rectangle
                {
                    id:icon
                    width: delegateRoot.width
                    height: delegateRoot.height
                    color: delegateRoot.color
                    property int visualIndex: delegateRoot.visualIndex
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                    Image {
                        id: name
                        anchors.centerIn: icon
                        width: delegateRoot.width
                        height: delegateRoot.height
                        fillMode: name.PreserveAspectCrop
                        //fillMode: name.PreserveAspectFit
                        source: delegateRoot.imageSource



                    }

                    // onPaint: {
                    //         var ctx = getContext("2d");
                    //         ctx.lineWidth=5
                    //         ctx.strokeStyle = delegateRoot.color
                    //         ctx.strokeRect(0, 0, width, height);
                    //     }

                    Text {
                        anchors.centerIn: parent
                        color: "white"
                        text: parent.visualIndex
                    }

                    DragHandler {
                        id: dragHandler
                    }

                    Drag.active: dragHandler.active
                    Drag.source: icon
                    Drag.hotSpot.x: 36
                    Drag.hotSpot.y: 36

                    states: [
                        State {
                            when: dragHandler.active
                            ParentChange {
                                target: icon
                                parent: icon.dragParent
                            }

                            AnchorChanges {
                                target: icon
                                anchors {
                                    horizontalCenter: undefined
                                    verticalCenter: undefined
                                }
                            }
                        }
                    ]


                }

        }
    }
}
    }
}
