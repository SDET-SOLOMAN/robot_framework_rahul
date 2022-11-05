*** Settings ***

Documentation    To validate the Login Form
Library          SeleniumLibrary


*** Test Cases ***
Validate Succesful Login
    Open the browser with the Mortgage payemnt url
    Fill the login Form
#    Wait untl it check and display error message
#    Verify error message is correct


*** Keywords ***
Open the browser with the Mortgage payemnt url
    Create Webdriver    Chrome  executable_path=/Users/mikesoloman/Desktop/robot_framework_rahul/chromedriver
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text  id:username     elLokoSoloMan
    Input Password    id:password   ElLoko
