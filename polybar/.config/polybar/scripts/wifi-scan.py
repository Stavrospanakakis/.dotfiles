#!/bin/python

import os

os.system("nmcli d wifi list")

ssid = input("Please enter the ssid:\n")
password = input("Please enter the password:\n")

if (password == ""):
    command = "nmcli d wifi connect " + ssid
else:
    command = "nmcli d wifi connect " + ssid + " password " + password

os.system(command)
