*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
This is sample test case
    [documentation] Google test
    [tags] regression
    Open Browser http://www.google.com chrome
    Close Browser

*** Keywords ***


