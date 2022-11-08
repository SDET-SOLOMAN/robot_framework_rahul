*** Settings ***

Documentation    To validate the Login Form
Library          SeleniumLibrary
Test Setup       Open the browser with the Mortgage payemnt url
# Test Teardown    Close Browser
Resource         resource.robot

*** Variables ***

*** Test Cases ***

Validate Unsuccesful Login
    Fill the login Form                     ${fake_user_name}       ${fake_password}
    Wait until element is there             ${error_message_css}
    Verify error message is correct

Validate Cards display in the Shopping Page
    Fill The Login Form                     ${actual_user_name}     ${actual_password}
    Wait until element is there             ${cart}
    Verify Card title in the Shop Page
    Select the Card                         Blackberry


Select the Form and Navigate to Child Window
    Fill the Login Details and Select the Admin User    ${actual_user_name}     ${actual_password}


