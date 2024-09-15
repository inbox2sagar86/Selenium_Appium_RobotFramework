*** Settings ***
Documentation  Simple example using AppiumLibrary
Library    String
Library    JSONLibrary
Library    OperatingSystem
Library    AppiumLibrary
Resource    bs_config.robot

*** Variables ***

${target_environment}    bs_android

################    Configuration to Run on Browserstack #######################
${bs_remote_url}    https://${username}:${accesskey}@hub-cloud.browserstack.com/wd/hub
# Upload the app WikiAlpha.apk in BrowserStack App Automate environment
${APP_ID}    bs://c7935e01817024a544de519c08a11f5f48c54b51
${bs_platformName}    Android
${bs_platformVersion}    9.0
${bs_deviceName}    Google Pixel 3

################    Configuration to Run on Physical Device  [ANDROID] #######################
${deviceName}    192.168.29.110:555
${local_remoteURL}    http://127.0.0.1:4723/wd/hub
${androidAutomationName}    UiAutomator2
${appPackage}    org.wikipedia.alpha
${appActivity}    org.wikipedia.main.MainActivity

*** Keywords ***
Launch Application On
    [Arguments]    ${targetPlatform}
    ${platform}    Convert To Lower Case    ${targetPlatform}
    IF    $platform == "local_android"
        # Open Application    	http://127.0.0.1:4723/wd/hub    platformName=Android    deviceName=192.168.29.110:5555    appPackage=org.wikipedia.alpha	appActivity=org.wikipedia.main.MainActivity    automationName=UiAutomator2
        Open Application    ${local_remoteURL}
        ...    platformName=${targetPlatform}    
        ...    deviceName=${deviceName}		
        ...	appPackage=${appPackage}    
        ...    appActivity=${appActivity}    
        ...    automationName=${androidAutomationName}
    ELSE IF    $platform == "bs_android"
    Open Application    ${bs_remote_url}
    ...  platformName=${bs_platformName}
    ...  platformVersion=${bs_platformVersion}
    ...  deviceName=${bs_deviceName}
    ...  app=${APP_ID}
    END

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

# Submit Search
#   Click Element  btn_start_search

# Search Query Should Be Matching
#   [Arguments]  ${text}
#   Wait Until Page Contains Element  android:id/search_src_text
#   Element Text Should Be  android:id/search_src_text  ${text}