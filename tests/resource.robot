*** Settings ***

Documentation    A resource file with reusable keywords and variable.
...
...             The system specifi keywords created here form our own
...             domain specifi language. They utilize keywords
...
Library         SeleniumLibrary
Library         OperatingSystem
Library         Collections
Library         String

*** Variables ***
${fake_user_name}       elLokoSoloMan
${fake_password}        ElLoko1999
${actual_user_name}     rahulshettyacademy
${actual_password}      learning
${error_message_css}    css:.alert-danger
${cart}                 css:.nav-link
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${card_titles}          xpath://h4[@class= 'card-title']
${add_button}           xpath:(//button[@class='btn btn-info'])
${username_field}       xpath://div[@class='container']//input[@type='text']
${password_field}       css:div.container input#password
${user_radio}           css:div.form-check-inline input[value*=user]
${okay_btn}             xpath://div[contains(@class, 'justify-content')]//button[@id='okayBtn']
${terms_checkbox}       xpath://div[@class='form-group']//input[@name='terms']
${blink_text}           css:a[href*='lshettyacademy.com/docum']
${child_text}           xpath://div[@class='inner-box'] / h1
${child_email}          xpath://div[@class='col-md-8']/p[@class='im-para red']



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
    @{expected_list}        Create List     iphone X     Samsung Note 8      Nokia Edge      Blackberry
    ${actual_elements}      Get Webelements     ${card_titles}
    @{actual_list}          Create List

    FOR     ${char}     IN      @{actual_elements}
          Log  ${char.text}
          Append To List    ${actual_list}      ${char.text}

    END

    Lists Should Be Equal    ${expected_list}           ${actual_list}


Select the Card
    [Arguments]              ${card_name}
    ${index}                 Set Variable    1
    ${elements}              Get Webelements    ${card_titles}
    FOR    ${element}       IN              @{elements}
        Exit For Loop if    '${card_name}' == '${element.text}'
        ${index}=   Evaluate     ${index} + 1
    END
    Click Button             xpath:(//button[@class='btn btn-info'])[${index}]



Fill the Login Details and Select the Admin User
    [Arguments]         ${user_name}        ${user_password}
    Input Text          ${username_field}   ${user_name}
    Input Password      ${password_field}   ${user_password}
    Click Element       ${user_radio}
    Wait Until Element Is Visible           ${okay_btn}
    Click Element       ${okay_btn}
    Select From List By Value    xpath://select[@class='form-control']  teach
    Select Checkbox     ${terms_checkbox}
    Checkbox Should Be Selected    ${terms_checkbox}



Select the Link of Child Window
    Click Element       ${blink_text}
    Sleep               10


Switch to Child Window
    Switch Window       NEW


Verify User switched to Child Window
    Element Text Should Be          ${child_text}       DOCUMENTS REQUEST


Grab the Email ID in the Child Window
    ${text}     Get Text            ${child_email}
    @{words}    Split String    ${text}         at
    ${text_split}       Get From List    ${words}   1
    @{words}    Split String    ${text_split}
    ${email}=    Get From List    ${words}           0
    log     ${email}
    Set Global Variable                     ${email}


Switch to Parent Window and enter Email
    Switch Window    MAIN
    Input Text       ${username_field}      ${email}
    Sleep            10
