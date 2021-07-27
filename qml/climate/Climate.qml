import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: root
    property real humidity: 0
    property string f: "Comfortaa"
    property string mm: month.model[month.currentIndex]
    property string dd: day.model[day.currentIndex]
    property string yy: year.model[year.currentIndex]
    property string lang: "English"
    property string thema: ""

    property int indexMonth: month.currentIndex

    ////////////////////////////////////////////////////////////////
    Text {
        id: hl_text
        text: qsTr("Date")
        font {family: f; pointSize: 12; bold: false}
        x: parent.width * 0.18
        y: parent.height * 0.18
    }
//    Rectangle {
//        anchors.fill: parent
//        border.color: "red"
//        color: "transparent"
//    }
    ////////////////////////////////////////////////////////
    onLangChanged: {
//        month.currentIndex = indexMonth
    }

    Rectangle {
        x: parent.width * 0.18
        y: parent.height * 0.35
        width: parent.width * 0.8
        height: parent.height * 0.5
        radius: 10

        Tumbler {
            id: month
            model: {
                if(lang === "English")
                    return ["January", "February", "March", "April", "May", "June",
                            "July", "August", "September", "October", "November",
                            "December"]
                if(lang === "Français")
                    return ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin",
                            "Juillet", "Août", "Septembre", "Octobre", "Novembre",
                            "Décembre"]
            }

            anchors.verticalCenter: parent.verticalCenter
            font {family: "Comfortaa"; bold: false}
            visibleItemCount: 3
            wrap: true
            width: parent.width * 0.5
            height: parent.height * 0.8

        }
        Tumbler {
            id: day
            model: ["1","2","3","4","5","6","7","8","9","10",
            "11","12","13","14","15","16","17","18","19","20",
            "21","22","23","24","25","26","27","28","29","30", "31"]
            anchors.verticalCenter: parent.verticalCenter
            font {family: "Comfortaa"; bold: false}
            visibleItemCount: 3
            wrap: true
            width: parent.width * 0.2
            height: parent.height * 0.8
            x: month.x + month.width
        }
        Tumbler {id: year
            model: ["2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"]
            anchors.verticalCenter: parent.verticalCenter
            font {family: "Comfortaa"; bold: false}
            visibleItemCount: 3
            wrap: true
            width: parent.width * 0.25
            height: parent.height * 0.8
            x: day.x + day.width

        }
    }


    ////////////////////////////////////////////////////////////////


}
