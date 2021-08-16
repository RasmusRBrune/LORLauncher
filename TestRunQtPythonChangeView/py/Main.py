import APItoolbox
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
    
    tb = APItoolbox.APItoolbox()

    # SIGNALS TO USE IN QML DESIGN
    isVisible = Signal(bool)
    viewIsVisible = Signal(bool)
    username = Signal(str)
    userToken = Signal(int)
    ###############################

    #DEFENITIONS
    @Slot(str, str, bool)
    def login(self, user, passw, closeWindow):
        self.tb.checkLogin(user, passw)
        #WINDOW ON CHANGE IF USER LOGIN RETURNS A TOKEN
        if self.tb.token != "0" and self.tb.token != "" and self.tb.token != "null":
            engine.load(os.path.join(os.path.dirname(__file__), "../Qml/Home.qml"))
            self.isVisible.emit(closeWindow)
    

    @Slot(bool)
    def changeview(self, viewvisible):
        print("Is view visible:", viewvisible)
        self.viewIsVisible.emit(viewvisible)

    #FAST ACCESS CODE TEST ENVIRONMENT
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

