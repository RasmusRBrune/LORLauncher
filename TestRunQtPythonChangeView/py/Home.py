import sys
import os
import requests
import json

from PySide6.QtGui import *
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import *
from PySide6.QtWidgets import *

class HomeWindow(QObject):
    def __init__(self):
        QObject.__init__(self)


    viewVisible = Signal(str)



    @Slot(str)
    def changeview(self, viewvisible):
        print("Is view visible:", viewvisible)
        #self.viewVisible = viewvisible
        self.viewVisible.emit(viewvisible)
