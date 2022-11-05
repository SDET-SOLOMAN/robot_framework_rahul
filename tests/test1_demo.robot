*** Settings ***

Documentation    To validate the Login Form
Library          SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${error_message_css}=   css:.alert-danger

*** Test Cases ***
Validate Unsuccesful Login
    Open the browser with the Mortgage payemnt url
    Fill the login Form
    Wait until element is there
    Verify error message is correct


*** Keywords ***
Open the browser with the Mortgage payemnt url
    Create Webdriver    Chrome  executable_path=/Users/mikesoloman/Desktop/robot_framework_rahul/chromedriver
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text  id:username     elLokoSoloMan
    Input Password    id:password   ElLoko
    Click Button    signInBtn

Wait until element is there
    Wait Until Element Is Visible    ${error_message_css}

Verify error message is correct
    #${result_1}=    Get Text   ${error_message_css}
    # Should Be Equal As Strings  ${result_1}   Incorrect username/password.
    Element Text Should Be    ${error_message_css}  Incorrect username/password.
