*** Settings ***

Documentation    To validate the Login Form
Library          SeleniumLibrary
Test Setup       Open the browser with the Mortgage payemnt url
Test Teardown    Close Browser
Resource         resource.robot
Test Template    Validate Unsuccesful Login

*** Variables ***

*** Test Cases ***          user_name          password
Invalid user_name           dsahed             learning
Invalud password            rahulshetty        plowHard
Special chars               !@*(#$*            learning


*** Keywords ***
Validate Unsuccesful Login
    [Arguments]                 ${user_name}        ${password}
    Fill the login Form         ${user_name}        ${password}
    Wait until element is there                     ${error_message_css}
    Verify error message is correct