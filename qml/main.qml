import QtQuick 2.13
import QtQuick.Window 2.13
import "climate"
import "highlight"
import "side"
import "setting"

Window {
    title: qsTr("wsaver")
    id: root
    width: Screen.width * 0.7 > 800 ? 1000 : 800
    height: Screen.height * 0.7 > 600 ? 600 : 600
    minimumWidth: 1000
    minimumHeight: 600
    maximumHeight: 600
    maximumWidth: 1000
    visible: true

//    property real tmp: width * 0.28 // = 322
//    property string deg: setting.deg
//    property string lang: setting.lang    //F6F6F8
//    property string thema: setting.thema //25294A

    Rectangle {
        anchors.fill: parent
        color: {
            if(setting.lang === "English"){
                if(setting.thema === "Light") {
                    climate.thema = "Light"
                    hl.thema = "Light"
                    side.theme = "Light"
                    return "#F6F6F8"
                }
                if(setting.thema === "Dark") {
                    climate.thema = "Dark"
                    hl.thema = "Dark"
                    side.theme = "Dark"
                    return "#25294A"
                }
            }

            if(setting.lang === "Français"){
                if(setting.thema === "Blanc") {
                    climate.thema = "Light"
                    hl.thema = "Light"
                    side.theme = "Light"
                    return "#F6F6F8"
                }
                if(setting.thema === "Noir") {
                    climate.thema = "Dark"
                    hl.thema = "Dark"
                    side.theme = "Dark"
                    return "#25294A"
                }
            }

            if(setting.lang === "Yoruba"){
                if(setting.thema === "Imọlẹ") {
                    climate.thema = "Light"
                    hl.thema = "Light"
                    side.theme = "Light"
                    return "#F6F6F8"
                }
                if(setting.thema === "Dudu") {
                    climate.thema = "Dark"
                    hl.thema = "Dark"
                    side.theme = "Dark"
                    return "#25294A"
                }
            }
        }
    }

    //////////////////////////////////////////////////////
    Climate {
        id: climate
        width: parent.width * 0.26
        height: parent.height * (1 - 0.65)
        x: side.width
        y: 0
        lang: setting.lang
    }

    Setting {
        id: setting
        width: parent.width - side.width - climate.width
        height: parent.height * (1 - 0.65)
        x: climate.x + climate.width
        y: 0
    }

    Highlight {
        id: hl
        width: parent.width - side.width
        height: parent.height * 0.65
        x: side.width
        y: parent.height - height
        lang: setting.lang
        place: side.place
        date: side.tmp_date
        yy: climate.yy
        mm: {
            if(climate.mm.length === 0) return "0"+climate.mm
            else return climate.mm
        }
        yy: {
            if(climate.mm === "January") return "01"
        }
    }

    //////////////////////////////////////////////////////
    property string tmp_mm: {
        if(setting.lang === "Français"){
            if(climate.mm === "Janvier") return "January"
            if(climate.mm === "Février") return "February"
            if(climate.mm === "Mars") return "March"
            if(climate.mm === "Avril") return "April"
            if(climate.mm === "Mai") return "May"
            if(climate.mm === "Juin") return "June"
            if(climate.mm === "Juillet") return "July"
            if(climate.mm === "Août") return "August"
            if(climate.mm === "Septembre") return "September"
            if(climate.mm === "Octobre") return "October"
            if(climate.mm === "Novembre") return "November"
            if(climate.mm === "Décembre") return "December"
        }
        if(setting.lang === "Yoruba"){
            if(climate.mm === "Oṣu Kini") return "January"
            if(climate.mm === "Kínní") return "February"
            if(climate.mm === "Oṣu Kẹta") return "March"
            if(climate.mm === "Oṣu Kẹrin") return "April"
            if(climate.mm === "Oṣu Karun") return "May"
            if(climate.mm === "Okudu") return "June"
            if(climate.mm === "Oṣu Keje") return "July"
            if(climate.mm === "Oṣu Kẹjọ") return "August"
            if(climate.mm === "Oṣu Kẹsan") return "September"
            if(climate.mm === "Oṣu Kẹwa") return "October"
            if(climate.mm === "Oṣu kọkanla") return "November"
            if(climate.mm === "Oṣu kejila") return "December"
        }
        return climate.mm


    }

//    property string th: {
//        if(climate.dd === "1" || climate.dd === "21" || climate.dd === "31") return "st"
//        if(climate.dd === "2" || climate.dd === "22") return "nd"
//        if(climate.dd === "3" || climate.dd === "23") return "rd"
//        else return "th"
//    }

    Side {
        id: side
        width: 322
        height: parent.height
        t: setting.deg
        date: climate.mm + " " + climate.dd +", "+ climate.yy
        tmp_date: root.tmp_mm + " " + climate.dd +", "+ climate.yy
        lang: setting.lang
//        theme: setting.thema
    }



}
