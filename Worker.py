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
        l = []
        print(data)
        for elt in data:
            if(elt["town"]) not in l:
                l.append(elt["town"])

        return l
