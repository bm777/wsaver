# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtGui import QFontDatabase
from PySide2.QtCore import QDir

from Worker import Worker


CURRENT_DIRECTORY = os.path.dirname(os.path.realpath(__file__))

def app():
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()

    worker = Worker()

    font_barlow = os.path.join(CURRENT_DIRECTORY, "font", "Barlow/Barlow-Regular.ttf")
    font_comfortaa = os.path.join(CURRENT_DIRECTORY, "font", "Comfortaa/Comfortaa-Regular.ttf")

    _id1 = QFontDatabase.addApplicationFont(font_barlow)
    _id2 = QFontDatabase.addApplicationFont(font_comfortaa)
    engine.rootContext().setContextProperty("bridge", worker)
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()

    worker = Worker()

    font_barlow = os.path.join(CURRENT_DIRECTORY, "font", "Barlow/Barlow-Regular.ttf")
    font_comfortaa = os.path.join(CURRENT_DIRECTORY, "font", "Comfortaa/Comfortaa-Regular.ttf")

    _id1 = QFontDatabase.addApplicationFont(font_barlow)
    _id2 = QFontDatabase.addApplicationFont(font_comfortaa)
    engine.rootContext().setContextProperty("bridge", worker)
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
