*** Settings ***

Documentation    A resource file with reusable keywords and variable.
...
...             The system specifi keywords created here form our own
...             domain specifi language. They utilize keywords
...
Library         SeleniumLibrary
Library         OperatingSystem

*** Variables ***
${fake_user_name}       elLokoSoloMan
${fake_password}        ElLoko1999
${actual_user_name}     rahulshettyacademy
${actual_password}      learning
${error_message_css}    css:.alert-danger
${cart}                 css:.nav-link
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${card_titles}          css:.card-title

*** Keywords ***
Open the browser with the Mortgage payemnt url
    Create Webdriver    Chrome  executable_path=/Users/mikesoloman/Desktop/robot_framework_rahul/chromedriver
    Go To               ${url}

Fill the login Form
    [Arguments]         ${user_name}     ${password}
    Input Text          id:username      ${user_name}
    Input Password      id:password      ${password}
    Click Button        signInBtn

Wait until element is there
    [Arguments]                      ${element_link}
    Wait Until Element Is Visible    ${element_link}

Verify error message is correct
    # ${result_1}=    Get Text   ${error_message_css}
    # Should Be Equal As Strings  ${result_1}   Incorrect username/password.
    Element Text Should Be    ${error_message_css}  Incorrect username/password.

Verify Card title in the Shop Page
    ${expected_list}=       Create List   iphoneX     Samsung Note 8      Nokia Edge      Blackberry
    ${actual_elements}=     Get Webelements     ${card_titles}

    FOR     ${char}     IN      @{actual_elements}
          Log  ${char.text}

    END

