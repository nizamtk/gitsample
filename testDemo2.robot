*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     Collections
Test Setup      Open the browser with given url
Test Teardown       Close Browser
Resource    resource.robot

*** Variables ***
${login_error}      username/password.
${checkout_display}     Checkout ( 0 )
@{expectedList} =   Create List      iphone X    Samsung Note 8      Nokia Edge      Blackberry
@{grabbedList} =    Create List
${CardName}     Blackberry
${index}        1

*** Test Cases ***
#Test unsuccessful login
    #Fill the login form     ${username}  ${invalid_password}
    #verify error message is correct

#validate cardsdisplay in shopping page
    #Fill the login form     ${username}  ${valid_password}
    #Wait Until Page Contains    ${checkout_display}
    #Verify card items in the page
    #Select the card     ${CardName}

Fill the login details in form
    Fill the login form with all detail


*** Keywords ***
Fill the login form
    [arguments]      ${username}     ${password}
    Input Text      username        ${username}
    Input Password      password        ${password}
    Click Button        id:signInBtn

verify error message is correct
    Wait Until Page Contains     ${login_error}

Verify card items in the page
    ${Realelements} =   Get WebElements       css:.card-title
    FOR     ${element}  IN  @{Realelements}
            Append To List      ${grabbedList}      ${element.text}
    END
    log     ${grabbedList}
    log     ${expectedList}
    Should Be Equal As Strings      ${grabbedList}      ${expectedList}

Select the card
    [arguments]     ${Card}
    ${Realelements} =   Get WebElements       css:.card-title
        #${index} =      Set Variable    1
    FOR  ${element}  IN  @{Realelements}
        Exit For Loop If        '${element.text}' == '${Card}'
        ${index} =      Evaluate    ${index}+1
    END
    Click Button    xpath:(//div[@class='card-footer'])[${index}]/button


Fill the login form with all detail
    Input Text      username        rahulshettyacademy
    Input Password      password        learning
    Click Element       xpath:(//span[@class='checkmark'])[2]
    Wait Until Element Is Visible       okayBtn
    Click Button        okayBtn
    Select From List By Value       xpath://select[@class='form-control']       teach
    Click Element       terms
    Click Button        id:signInBtn
