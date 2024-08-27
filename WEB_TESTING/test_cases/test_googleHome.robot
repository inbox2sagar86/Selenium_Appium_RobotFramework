*** Settings ***
Resource    ../keywords_library/browser_config.robot
Resource    ../keywords_library/page_specific_keywords/keywords_search_page.robot
Suite Setup    Launch Browser
Suite Teardown    Close All Browsers


*** Test Cases ***
Type BrowserStack in SearchBox
    [Documentation]    Type browserStack in Search Box area and validate the first link
    Search    BrowserStack
    Press Keys    ${None}    RETURN
    Should Contain    ${url_browser_stack}    browserstack
