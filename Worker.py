# This Python file uses the following encoding: utf-8
from PySide2 import QtWidgets
from PySide2.QtCore import QObject, Signal, Slot, Property
import os
from local_request import import_forecast, import_volumetric, get_index_and_value, select_12_days, percent_flood

class Worker(QObject):
    """docstring for Worker."""

    def __init__(self):
        QObject.__init__(self)
        self.tmp = 55



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
        # print(l)
        return l

    @Slot(str, str, result="QVariant")
    def getForecastData(self, place, date):
        data = self.slot_forecast()
        file_flood_ng = "era5_volumetric_soil_water_layer_1-hourly-5.0405866_7.9194225.csv"
        file_flood_gh = "era5_volumetric_soil_water_layer_1-hourly-5.6901705_-0.2099204.csv"

        for elt in data["forecasts"]:
            if(place == elt["town"] and date == elt["date"]):

                return [elt["town"], elt["date"],
                    elt["pressure"], elt["temperature"], elt["humidity"], elt["condition"],
                    elt["wind"], elt["wind_direction"], elt["rain"], self.tmp, 102, elt["lat"], elt["long"]]


        return [-1] * 13
