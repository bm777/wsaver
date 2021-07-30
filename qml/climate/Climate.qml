import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12


Item {
    id: root
    property real humidity: 0
    property string f: "Comfortaa"
    property string mm: {
        if(lang==="English" && thema ==="Light") return month.model[indexMonth]
        if(lang==="Français" && thema ==="Light") return month_fr.model[indexMonth]

        if(lang==="English" && thema ==="Dark") return month_dark.model[indexMonth]
        if(lang==="Français" && thema ==="Dark") return month_fr_dark.model[indexMonth]
    }

    property string dd: {
        // day.model[day.currentIndex]
        if(thema === "Light") return day.model[indexDay]
        if(thema === "Dark") return day_dark.model[indexDay]
    }

    property string yy: {

        if(thema === "Light") return year.model[indexYear]
        if(thema === "Dark") return year_dark.model[indexYear]
    }

    property string lang: "English"
    property string thema: ""

    property int indexMonth: {
        if(month.visible){
            month_fr.currentIndex = month.currentIndex
            month_dark.currentIndex = month.currentIndex
            month_fr_dark.currentIndex = month.currentIndex
            return month.currentIndex
        }
        if(month_fr.visible){
            month.currentIndex = month_fr.currentIndex
            month_dark.currentIndex = month_fr.currentIndex
            month_fr_dark.currentIndex = month_fr.currentIndex
            return month_fr.currentIndex
        }

        if(month_dark.visible){
            month.currentIndex = month_dark.currentIndex
            month_fr.currentIndex = month_dark.currentIndex
            month_fr_dark.currentIndex = month_dark.currentIndex
            return month_dark.currentIndex
        }
        if(month_fr_dark.visible){
            month_dark.currentIndex = month_fr_dark.currentIndex
            month.currentIndex = month_dark.currentIndex
            month_fr.currentIndex = month_dark.currentIndex
            return month_fr_dark.currentIndex
        }

    }

    property string indexDay: {
        if(day.visible){
            day_dark.currentIndex = day.currentIndex
            return day.currentIndex
        }
        if(day_dark.visible){
            day.currentIndex = day_dark.currentIndex
            return day_dark.currentIndex
        }
    }
    property string indexYear: {
        if(year.visible){
            year_dark.currentIndex = year.currentIndex
            return year.currentIndex
        }
        if(year_dark.visible){
            year.currentIndex = year_dark.currentIndex
            return year_dark.currentIndex
        }
    }


    ////////////////////////////////////////////////////////////////
    Text {
        id: hl_text
        text: lang === "Yoruba" ? "ọjọ" : "Date"
        font {family: f; pointSize: 12; bold: false}
        x: parent.width * 0.18
        y: parent.height * 0.18
        color: thema === "Light" ? "#000000" : "#E9EBF9"
    }

    ////////////////////////////////////////////////////////
    RectangularGlow {
        anchors.fill: frame_date
        spread: 0.1
        glowRadius: frame_date.radius
        color: {

            if(root.thema === "Light") return "#10000000"
            if(root.thema === "Dark") return "#20ffffff"
        }
    }



    Rectangle {
        id: frame_date
        x: parent.width * 0.18
        y: parent.height * 0.35
        width: parent.width * 0.8
        height: parent.height * 0.5
        radius: 10
        color: {
            if(thema === "Light") return "#ffffff"
            else return "#202442"

        }
        /////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////
        // Light
        Tumbler {
            id: month
            model: ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November",
                "December"]
            anchors.verticalCenter: parent.verticalCenter
            font {family: "Comfortaa"; bold: false}
            visibleItemCount: 3
            wrap: true
            width: parent.width * 0.5
            height: parent.height * 0.8
            visible: root.lang === "English" && thema==="Light"
        }
        Tumbler {
            id: month_fr
            model: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin",
                "Juillet", "Août", "Septembre", "Octobre", "Novembre",
                "Décembre"]
            anchors.verticalCenter: parent.verticalCenter
            font {family: "Comfortaa"; bold: false}
            visibleItemCount: 3
            wrap: true
            width: parent.width * 0.5
            height: parent.height * 0.8
            visible: root.lang === "Français" && thema==="Light"
        }
        Tumbler {
            id: month_yo
            model: ["Oṣu Kini", "Kínní", "Oṣu Kẹta", "Oṣu Kẹrin", "Oṣu Karun", "Okudu",
                "Oṣu Keje", "Oṣu Kẹjọ", "Oṣu Kẹsan", "Oṣu Kẹwa", "Oṣu kọkanla",
                "Oṣu kejila"]
            anchors.verticalCenter: parent.verticalCenter
            font {family: "Comfortaa"; bold: false}
            visibleItemCount: 3
            wrap: true
            width: parent.width * 0.5
            height: parent.height * 0.8
            visible: root.lang === "Yoruba" && thema==="Light"
        }

        Tumbler {
            id: day
            model: {
                if(month.currentIndex == 1 || month_fr.currentIndex == 1 || month_yo.currentIndex == 1) {
                    return ["1","2","3","4","5","6","7","8","9","10",
                            "11","12","13","14","15","16","17","18","19","20",
                            "21","22","23","24","25","26","27","28","29"]
                }else return ["1","2","3","4","5","6","7","8","9","10",
                              "11","12","13","14","15","16","17","18","19","20",
                              "21","22","23","24","25","26","27","28","29","30", "31"]
            }
            visible: thema==="Light"
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
            visible: thema==="Light"

        }

        /////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////
        // Dark
        Tumbler {
            id: month_dark
            model: ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November",
                "December"]
            anchors.verticalCenter: parent.verticalCenter
            font {family: "Comfortaa"; bold: false}
            visibleItemCount: 3
            wrap: true
            width: parent.width * 0.5
            height: parent.height * 0.8
            visible: root.lang === "English" && thema==="Dark"
            delegate: Text {
                property int displacement: Math.abs(Tumbler.displacement)
                text: modelData
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: month_dark.font
                color: displacement == 0 ? "#ffffff" : "#40ffffff"
            }
        }
        Tumbler {
            id: month_fr_dark
            model: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin",
                "Juillet", "Août", "Septembre", "Octobre", "Novembre",
                "Décembre"]
            anchors.verticalCenter: parent.verticalCenter
            font {family: "Comfortaa"; bold: false}
            visibleItemCount: 3
            wrap: true
            width: parent.width * 0.5
            height: parent.height * 0.8
            visible: root.lang === "Français" && thema==="Dark"
            delegate: Text {
                property int displacement: Math.abs(Tumbler.displacement)
                text: modelData
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: month_fr_dark.font
                color: displacement == 0 ? "#ffffff" : "#40ffffff"
            }
        }
        Tumbler {
            id: month_yo_dark
            model: ["Oṣu Kini", "Kínní", "Oṣu Kẹta", "Oṣu Kẹrin", "Oṣu Karun", "Okudu",
                "Oṣu Keje", "Oṣu Kẹjọ", "Oṣu Kẹsan", "Oṣu Kẹwa", "Oṣu kọkanla",
                "Oṣu kejila"]
            anchors.verticalCenter: parent.verticalCenter
            font {family: "Comfortaa"; bold: false}
            visibleItemCount: 3
            wrap: true
            width: parent.width * 0.5
            height: parent.height * 0.8
            visible: root.lang === "Yoruba" && thema==="Dark"
            delegate: Text {
                property int displacement: Math.abs(Tumbler.displacement)
                text: modelData
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: month_yo_dark.font
                color: displacement == 0 ? "#ffffff" : "#40ffffff"
            }
        }
        Tumbler {id: day_dark
            model: {
                if(month.currentIndex == 1) {
                    return ["1","2","3","4","5","6","7","8","9","10",
                            "11","12","13","14","15","16","17","18","19","20",
                            "21","22","23","24","25","26","27","28","29"]
                }else return ["1","2","3","4","5","6","7","8","9","10",
                              "11","12","13","14","15","16","17","18","19","20",
                              "21","22","23","24","25","26","27","28","29","30", "31"]
            }
            anchors.verticalCenter: parent.verticalCenter
            font {family: "Comfortaa"; bold: false}
            visibleItemCount: 3
            wrap: true
            width: parent.width * 0.25
            height: parent.height * 0.75
            x: month_dark.x + month_dark.width - 5
            visible: thema==="Dark"
            delegate: Text {
                property int displacement: Math.abs(Tumbler.displacement)
                text: modelData
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: day_dark.font
                color: displacement == 0 ? "#ffffff" : "#40ffffff"
            }
        }
        Tumbler {id: year_dark
            model: ["2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"]
            anchors.verticalCenter: parent.verticalCenter
            font {family: "Comfortaa"; bold: false}
            visibleItemCount: 3
            wrap: true
            width: parent.width * 0.25
            height: parent.height * 0.75
            x: day.x + day.width
            visible: thema==="Dark"
            delegate: Text {
                property int displacement: Math.abs(Tumbler.displacement)
                text: modelData
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: year_dark.font
                color: displacement == 0 ? "#ffffff" : "#40ffffff"
            }
        }
    }



    ////////////////////////////////////////////////////////////////


}
