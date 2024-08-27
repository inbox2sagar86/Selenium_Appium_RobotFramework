*** Settings ***
Library    Selenium2Library
Resource    ../../locator_library/page_specific_locators/loc_search_page.robot
*** Keywords ***
Search
    [Arguments]    ${text}
    Input Text    ${search_box}    ${text}