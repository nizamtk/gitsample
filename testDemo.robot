*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Test Teardown       Close Browser

*** Variables ***
${login_error}      username/password.

*** Test Cases ***
Test title
    [Tags]    DEBUG
    Open the browser with given url
    Fill the login form
    verify error message is correct

*** Keywords ***
Open the browser with given url
    Create Webdriver    Chrome      executable_path=E:/chromedriver
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    Input Text      username        nizamtk
    Input Password      password        2370
    Click Button        id:signInBtn

verify error message is correct
    Wait Until Page Contains     ${login_error}


