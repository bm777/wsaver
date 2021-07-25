import QtQuick 2.12
import QtQuick.Controls 2.15
//import QtQuick.Window 2.2


    Tumbler {
        model: ["January", "February", "March", "April", "May"]

        font {family: "Comfortaa"; bold: false}
        visibleItemCount: 3
        wrap: true

    }

