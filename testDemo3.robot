*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     Collections
Library     String
Test Setup      Open the browser with given url
Test Teardown       Close Browser
Resource    resource.robot

*** Variables ***


*** Test Cases ***
Grab email from child window
    navigate to child window
    Verify child window
    Grab email from text
    navigate to parent window and update field


*** Keywords ***
navigate to child window
    click element       css:.blinkingText
    Switch Window       NEW

Verify child window
    Element Text Should Be      css:h1      DOCUMENTS REQUEST

Grab email from text
    ${grabbed_text}=    Get Text        css:.red
    @{sub_string}=      Split String        ${grabbed_text}     at
    ${text_split}       Get From List       ${sub_string}       1
    @{string_words}=    Split String        ${text_split}
    ${email}=   Get From List       ${string_words}       0
    Set Global Variable     ${email}

navigate to parent window and update field
    Switch Window       MAIN
    Input Text      username        ${email}