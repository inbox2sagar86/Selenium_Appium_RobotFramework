*** Settings ***
Library    Selenium2Library

*** Variables ***
${BROWSER}    firefox
${url}    https://www.google.com/

*** Keywords ***
Launch Browser
    IF    $BROWSER == "chrome" or $BROWSER == "headlesschrome"
        Open Browser    ${url}    ${BROWSER}    options=add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors")
        Log To Console    Chrome Browser
    END
    IF    $BROWSER == "firefox"
        Open Browser    ${url}    ${BROWSER}
        Log To Console    Firefox Browser
    END
    IF    $BROWSER == "edge"
        Open Browser    ${url}    ${BROWSER}
        Log To Console    Edge Browser
    END 
    Maximize Browser Window
    Sleep    2s