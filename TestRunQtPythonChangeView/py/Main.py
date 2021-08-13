import sys
import os
import requests
import json
import Home

#from TestRunQtPythonChangeView.py.Home import HomeWindow
from PySide6.QtGui import *
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import *
from PySide6.QtWidgets import *

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
    
    # SIGNALS TO USE IN QML DESIGN
    isVisible = Signal(bool)
    viewIsVisible = Signal(bool)
    username = Signal(str)
    token = Signal(int)
    ###############################

    #DEFENITIONS
    @Slot(bool)
    def changeview(self, viewvisible):
        print("Is view visible:", viewvisible)
        self.viewIsVisible.emit(viewvisible)

    #code til at hurtig komme ind på home siden slet ending vi afliværer opgaven 
    @Slot(bool)
    def changetohome(self, closeWindow):
        engine.load(os.path.join(os.path.dirname(__file__), "../Qml/Home.qml"))
        self.isVisible.emit(closeWindow)

################################################################################################
#                                       RUNNING CODE                                           #
################################################################################################

if __name__ == "__main__":
    
    main = MainWindow() 
    home = Home.HomeWindow()
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
   
    engine.rootContext().setContextProperty("ConMain",main)
    engine.rootContext().setContextProperty("ConHome",home)
    engine.load(os.path.join(os.path.dirname(__file__), "../Qml/Main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())

