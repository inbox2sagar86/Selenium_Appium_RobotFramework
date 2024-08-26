*** Settings ***
Library    Selenium2Library

*** Variables ***
${BROWSER}    chrome
${url}    https://www.google.com/

*** Keywords ***
launch Browser
    Open Browser    ${url}    ${BROWSER}

*** Test Cases ***
Open google
    launch Browser