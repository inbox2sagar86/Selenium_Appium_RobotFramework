*** Settings ***
Resource    ../config/test_launchApp.robot
Suite Setup    Launch Application On    bs_android

*** Test Cases ***
Search Wikipedia
    #"deviceName": "ZD222C3NRZ",
    Input Search Query    Wikipedia