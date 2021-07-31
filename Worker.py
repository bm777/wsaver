# This Python file uses the following encoding: utf-8
from PySide2 import QtWidgets
from PySide2.QtCore import QObject, Signal, Slot, Property
import os
import pandas as pd
from local_request import import_forecast, import_volumetric, get_index_and_value, select_12_days, percent_flood

class Worker(QObject):
    """docstring for Worker."""

    def __init__(self):
        QObject.__init__(self)
        self.tmp = 0



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

    def parseDate(self, yy, mm, dd):
        return

    @Slot(str, str, str, str, result="QVariant")
    def getFloodRisk(self, place, yy, mm, dd):
        ######################################################
        ## preparing the data for pushing
        if(place == "Uyo, NG"):
            file = file_flood_ng
        else:
            file = file_flood_gh

        df = import_volumetric(file)

        # parsing date from January 1, 2021 to 2021-01-01 (Y-m-d)
        #date = self.parseDate(date)
        date =yy+"-"+mm+"-"+dd+" 00:00:00"

        # getting the index and value of a specific date ie : in var data
        index, value = get_index_and_value(df, date)

        # getting the DF of 12 day ie 288 rows
        selection = select_12_days(df, index)

        # percentage of the forecast vlaue compare to 12 days before
        # and ten if it is in top 5% of higthest value -> hight flood risk######################################################
        ## preparing the data for pushing
        if(place == "Uyo, Ng"):
            file = file_flood_ng
        else:
            file = file_flood_gh

        df = import_volumetric(file)

        # parsing date from January 1, 2021 to 2021-01-01 (Y-m-d)
        date = self.parseDate(date)

        # getting the index and value of a specific date ie : in var data
        index, value = get_index_and_value(df, date)

        # getting the DF of 12 day ie 288 rows
        selection = select_12_days(df, index)

        # percentage of the forecast vlaue compare to 12 days before
        # and ten if it is in top 5% of higthest value -> hight flood risk
        percent = percent_flood(selection, value)
        percent = round(percent, 1) # fixed to 1 digit after the dot.

        #######################################################
        percent = percent_flood(selection, value)
        percent = round(percent, 1) # fixed to 1 digit after the dot.
        return [percent]
        #######################################################

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
