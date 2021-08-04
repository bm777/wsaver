# This Python file uses the following encoding: utf-8
from PySide2 import QtWidgets
from PySide2.QtCore import QObject, Signal, Slot, Property
import os
import pandas as pd
from local_request import import_forecast, import_volumetric, get_index_and_value, select_12_days, percent_flood

import speech_recognition as sr
import pyttsx3

class Worker(QObject):
    """docstring for Worker."""

    def __init__(self):
        QObject.__init__(self)
        self.tmp = 0



    @Slot(str, result="QVariant")
    def slot_forecast(self, filename="forecast.json"):
        # Read the json file
        data = import_forecast(filename)

        return data

    @Slot(result="QVariant")
    def slot_towns(self):
        # Return the list of town on the json file
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
        file_flood_ng = "era5_volumetric_soil_water_layer_1-hourly-5.0405866_7.9194225.csv"
        file_flood_gh = "era5_volumetric_soil_water_layer_1-hourly-5.6901705_-0.2099204.csv"

        if(place == "Uyo, NG"):
            file = file_flood_ng
        else:
            file = file_flood_gh

        df = import_volumetric(file)

        # parsing date from January 1, 2021 to 2021-01-01 (Y-m-d)
        #date = self.parseDate(date)
        date =yy+"-"+mm+"-"+dd+" 00:00:00"

        # getting the index and value of a specific date ie : in var data
        #print(date)
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
        #print(percent)
        return [percent]
        #######################################################


    @Slot(str, str, str, str, result="QVariant")
    def getAir(self, place, yy, mm, dd):

        ## preparing the data for pushing
        file_flood_ng = "era5_wind_100m_u-hourly-5.0405866_7.9194225.csv"
        file_flood_gh = "era5_wind_100m_u-hourly-5.6901705_-0.2099204.csv"


        if(place == "Uyo, NG"):
            file = file_flood_ng
        else:
            file = file_flood_gh

        # load csv file on dataframe
        file = os.path.join(os.path.dirname(__file__), file)
        df1 = pd.read_csv(file)
        #df2 = pd.read_csv(file2)

        # split the df
        df1[["value", "t1", "t2", "t3"]] = df1.value.str.split(" ", expand=True)
        #df2[["speed", "t1", "t2", "t3"]] = df2.value.str.split(" ", expand=True)

        # remove column unusable
        df1.pop("t1"), df1.pop("t2"), df1.pop("t3")
        #df2.pop("value"), df2.pop("t1"), df2.pop("t2"), df2.pop("t3")

        df = df1

        # parsing date from January 1, 2021 to 2021-01-01 (Y-m-d)
        #date = self.parseDate(date)
        date =yy+"-"+mm+"-"+dd+" 00:00:00"

        # getting the index and value of a specific date ie : in var data
        #print(date)
        index, value = get_index_and_value(df, date)

        # getting the DF of 12 day ie 288 rows
        selection = select_12_days(df, index)

        # percentage of the forecast vlaue compare to 12 days before
        # and ten if it is in top 5% of higthest value -> hight flood risk
        percent = percent_flood(selection, value)
        percent = round(percent, 1) # fixed to 1 digit after the dot.
        #print(percent)
        return [percent]




    @Slot(str, str, result="QVariant")
    def getForecastData(self, place, date):
        # That funtion return forecast on the json file
        data = self.slot_forecast()

        for elt in data["forecasts"]:
            if(place == elt["town"] and date == elt["date"]):

                return [elt["town"], elt["date"],
                    elt["pressure"], elt["temperature"], elt["humidity"], elt["condition"],
                    elt["wind"], elt["wind_direction"], elt["rain"], self.tmp, 102, elt["lat"], elt["long"]]


        return [-1] * 13


    @Slot(result="QVariant")
    def getTextFromVoice(self):
        # That function return a text from a voice
        # It is a voice spkoen by the user
        r = sr.Recognizer()
