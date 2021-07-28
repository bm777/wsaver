# This Python file uses the following encoding: utf-8
from PySide2 import QtWidgets
from PySide2.QtCore import QObject, Signal, Slot, Property
import os
from local_request import import_forecast

class Worker(QObject):
    """docstring for Worker."""

    def __init__(self):
        QObject.__init__(self)



    @Slot(str, result="QVariant")
    def slot_forecast(self, filename="forecast.json"):
        data = import_forecast(filename)

        return data

    @Slot(result="QVariant")
    def slot_towns(self):
        data = self.slot_forecast()
        #print(type(data))
        l = []
        for elt in data["forecasts"]:
            if(elt["town"] not in l):
                l.append(elt["town"])
        print(l)
        return l

    @Slot(str, str, result="QVariant")
    def getForecastData(self, place, date):
        data = self.slot_forecast()

        for elt in data["forecasts"]:
            if(place == elt["town"] and date == elt["date"]):

                return [elt["town"], elt["date"],
                    elt["pressure"], elt["temperature"], elt["humidity"], elt["condition"],
                    elt["wind"], elt["wind_direction"], elt["rain"], 5, 102]


        return [None] * 11
