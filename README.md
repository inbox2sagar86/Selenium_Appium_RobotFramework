<!-- This is a single framework designed for Web Applicantion Testing , mobile application testing and also in cloud environment.like BrowserStack -->


#####  SETUP #######

1. Install Python in your System from https://www.python.org/downloads/
2. Set up the python environment as per the system requirement. 
3. Install Visual Studio Code Editor  from https://code.visualstudio.com/
4. Open Visual Studio Code and install the following extensions 
   a. Pylance
   b. Robot Framework Language Server

## To Test on Physical Mobile Devices below installations are required. ##
<!-- Note :  Android SDK manager is required to install to run our automation script on a specific version and ADB(android Debug Bridge) is mandatory as it establishes communication between mobile device and Android SDK and Appium .  You can install Command line tools only from the below link without installing Android Studio-->
1. Download Android SDK from  https://developer.android.com/studio#command-tools 
2. Unzip the android sdk file and set the environment variable "ANDROID_HOME" to the path.(For Windows users).
3. Follow the process to download uiautomatator2 in android https://appium.io/docs/en/2.4/quickstart/uiauto2-driver/

#####    Configuration and installation part  ######
1. Install Node js
2. Install appium using command  npm i -g appium
3. Start appium with command "appium --base-path /wd/hub"
Run pip install -r requirements.txt
Run appium driver install uiautomator2

#### To Run Test case in Browserstack environment #####
browserstack-sdk robot .\WEB_TESTING\test_cases\test_googleHome.robot

##### trouble shooting #######
Error  :  No application to Open
Fix : Run the command appium --base-path /wd/hub
