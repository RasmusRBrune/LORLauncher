import json
import APItoolbox

from PySide6.QtQuick import QQuickItem, QQuickView
from PySide6.QtGui import *
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import *
from PySide6.QtWidgets import *

class HomeWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

    

    #SIGNALS TO USE IN QML DESIGN
    viewIsVisible = Signal(bool)
    listSinal = Signal(str)
    friendsList = []
    usname = []

    #DEFENITIONS
    @Slot(bool)
    def changeview(self, viewvisible):
        print("Is view visible:", viewvisible)
        self.viewIsVisible.emit(viewvisible)

    @Slot()
    def getfriendsList(self,fList):
        self.friendsList = fList
        
        self.getusername()

    @Slot()
    def getusername(self):
        for elem in self.friendsList:
            for user in elem:
                self.name = user
                self.usname.append(self.name['username'])
        self.listSinal.emit(str(self.usname)) 
