*** Settings ***

Library     SeleniumLibrary
Variables   ../Locators/BaseLocators.py


*** Keywords ***

Open the Browser with URL
    Open Browser                  ${WEBSITE_URL}           ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Close Browser Session
    Close Browser
