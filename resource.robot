*** Settings ***
Documentation    Resource file

*** Variables ***
${username}     rahulshettyacademy
${invalid_password}     2370
${valid_password}     learning

*** Keywords ***
Open the browser with given url
    Create Webdriver    Chrome      executable_path=C:/chromedriver
    Go To   https://rahulshettyacademy.com/loginpagePractise/
