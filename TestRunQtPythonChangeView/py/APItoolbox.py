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


class APItoolbox(QObject):
    def __init__(self):
        QObject.__init__(self)
    #DEFINITIONS
    def checkLogin(self, user, passw, closeWindow):
        engine = QQmlApplicationEngine()
        #API URL
        url = 'http://192.168.4.231:48935/api/Users/Login'
        #HEADERS
        headers = {'content-type':'application/json'}
        #BODY TO POST
        body = {
            'Username': user,
            'Password': passw
        }
        #STRINGIFY JSON BODY FOR API
        data=json.dumps(body, separators=(',',':'))
        #REQUEST POST FOR LOGIN
        r=requests.post(url=url, data=data, headers=headers)
        #SAVE TOKEN
        self.token = int(r.text)
        print(self.token) # USED FOR CHECKING # SAVE FOR LATER

        #WINDOW ON CHANGE IF USER LOGIN RETURNS A TOKEN
        if self.token != "0" and self.token != "" and self.token != "null":
            engine.load(os.path.join(os.path.dirname(__file__), "../Qml/Home.qml"))
            self.isVisible.emit(closeWindow)
