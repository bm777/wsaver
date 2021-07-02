# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtGui import QFontDatabase
from PySide2.QtCore import QDir


CURRENT_DIRECTORY = os.path.dirname(os.path.realpath(__file__))

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    font_path = os.path.join(CURRENT_DIRECTORY, "font", "Barlow/Barlow-Regular.ttf")

    _id = QFontDatabase.addApplicationFont(font_path)
    print(QFontDatabase.applicationFontFamilies(_id))
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
