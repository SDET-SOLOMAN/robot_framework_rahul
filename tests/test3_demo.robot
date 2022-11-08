*** Settings ***

Documentation    To validate the Login Form
Library          SeleniumLibrary
Test Setup       Open the browser with the Mortgage payemnt url
Test Teardown    Close Browser
Resource         resource.robot

*** Variables ***

*** Test Cases ***

Validate Child Window Functionality
    Select the Link of Child Window
    Switch to Child Window
    Verify User switched to Child Window
    Grab the Email ID in the Child Window
    Switch to Parent Window and enter Email
