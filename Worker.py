# This Python file uses the following encoding: utf-8
from PySide2 import QtWidgets
from PySide2.QtCore import QObject, Signal, Slot, Property
import os
from loca_request import import_forecast

class Worker(QObject):
    """docstring for Worker."""

    def __init__(self):
        QObject.__init__(self)



    @Slot(str, result="QVariantList")
    def slot_forecast(self, filename="forecasts.json"):
        data = import_forecast(filename)
        return data
