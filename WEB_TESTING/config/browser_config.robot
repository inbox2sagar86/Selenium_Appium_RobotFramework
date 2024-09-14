*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary


*** Variables ***
${BROWSER}    browserstack
${url}    https://www.google.com/
# BrowserStack Parameters
${os_name}
${os_version}
${browser_name}
${browser_version}

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
    ######### To run test cases in Browser stack environment
    ################  browserstack-sdk robot .\WEB_TESTING\test_cases\test_googleHome.robot ############
    IF    $BROWSER == "browserstack"
        open browser    remote_url=http://localhost:4444/wd/hub    url=${url}
        # Log To Console    Br
    END
    Maximize Browser Window
    Sleep    2s