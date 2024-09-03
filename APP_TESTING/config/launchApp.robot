*** Settings ***
Documentation  Simple example using AppiumLibrary
Library  AppiumLibrary
Library    String
Library    JSONLibrary
Library    OperatingSystem

*** Variables ***
${Envionment}    local_Android
${jsonPath}    ${EXECDIR}/APP_TESTING/resources/local_app_config.json
# ${ANDROID_AUTOMATION_NAME}    UIAutomator2
# ${ANDROID_APP}                ${CURDIR}/demoapp/ApiDemos-debug.apk
# ${ANDROID_PLATFORM_NAME}      Android
# ${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=11}

*** Test Cases ***
Should send keys to search box and then check the value
#   Open Test Application
#   Input Search Query  Hello World!
#   Submit Search
#   Search Query Should Be Matching  Hello World!
    Log To Console    ${EXECDIR}
    ${status}    Run Keyword And Return Status    File Should Exist    ${jsonPath}
    Log To Console    status is ${status}


*** Keywords ***
# Open Test Application
#     ${target}    Convert To Lower Case    ${Envionment}
#     IF    $target == "local_android"
#         Open Application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
#   ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
#   ...  app=${ANDROID_APP}  appPackage=io.appium.android.apis  appActivity=.app.SearchInvoke  



#     IF   $target == "local_ios"
#         Open Application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
#   ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
#   ...  app=${ANDROID_APP}  appPackage=io.appium.android.apis  appActivity=.app.SearchInvoke
#     ELSE
#         Fatal Error    !!!! No Target Environment Selected . Please select either Android or iOS !!!!!
#     END

Input Search Query
  [Arguments]  ${query}
  Input Text  txt_query_prefill  ${query}

Submit Search
  Click Element  btn_start_search

Search Query Should Be Matching
  [Arguments]  ${text}
  Wait Until Page Contains Element  android:id/search_src_text
  Element Text Should Be  android:id/search_src_text  ${text}


Read Environmet Configs From Json File
    ${status}    Run Keyword And Return Status    File Should Exist    ${jsonPath}
    IF    $status == $True
        ${json_object}    Load Json From File    ${jsonPath}
    ELSE
        Fatal Error    !!!!! Either Json is not present in the mentioned path or check the name !!!!
    END
    