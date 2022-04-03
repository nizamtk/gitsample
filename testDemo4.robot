*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Test Teardown       Close Browser
Test Template       Test login feature of E-commerce webiste

*** Variables ***
${login_error}      username/password.

*** Test Cases ***      Username        password
Invalid Username        dashed          learning
Invalid password        rahulshetty     7852

*** Keywords ***
Test login feature of E-commerce webiste
    [arguments]    ${username}      ${password}
    Open the browser with given url
    Fill the login form     ${username}      ${password}
    verify error message is correct

Open the browser with given url
    Create Webdriver    Chrome      executable_path=C:/chromedriver
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    [arguments]         ${username}     ${password}
    Input Text          username        ${username}
    Input Password      password        ${password}
    Click Button        id:signInBtn

verify error message is correct
    Wait Until Page Contains     ${login_error}


