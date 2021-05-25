# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'no2.ui'
#
# Created by: PyQt5 UI code generator 5.9.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName("Form")
        Form.resize(596, 371)
        self.label = QtWidgets.QLabel(Form)
        self.label.setGeometry(QtCore.QRect(210, 80, 151, 16))
        font = QtGui.QFont()
        font.setPointSize(12)
        self.label.setFont(font)
        self.label.setObjectName("label")
        self.namaEdit = QtWidgets.QLineEdit(Form)
        self.namaEdit.setGeometry(QtCore.QRect(140, 120, 301, 20))
        self.namaEdit.setObjectName("namaEdit")
        self.clear = QtWidgets.QPushButton(Form)
        self.clear.setGeometry(QtCore.QRect(340, 180, 101, 23))
        self.clear.setObjectName("clear")
        self.clear.clicked.connect(self.namaEdit.clear)
        self.keluar = QtWidgets.QPushButton(Form)
        self.keluar.setGeometry(QtCore.QRect(240, 230, 101, 23))
        self.keluar.setObjectName("keluar")
        self.keluar.clicked.connect(Form.close)
        self.hallo = QtWidgets.QPushButton(Form)
        self.hallo.setGeometry(QtCore.QRect(140, 180, 101, 23))
        self.hallo.setObjectName("hallo")

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

    def retranslateUi(self, Form):
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "Form"))
        self.label.setText(_translate("Form", "Masukan Nama Anda"))
        self.clear.setText(_translate("Form", "Clear"))
        self.keluar.setText(_translate("Form", "Keluar"))
        self.hallo.setText(_translate("Form", "Hallo"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())

