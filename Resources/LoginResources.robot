*** Settings ***

Library    SeleniumLibrary
Variables  ../Locators/LoginPageLocators.py

*** Keywords ***

Fill the login form
   [Arguments]                   ${username}               ${password}
   Input Text                    ${USER_NAME_LOCATOR}      ${username}
   Input Password                ${PASSWORD_LOCATOR}       ${password}
   Click Button                  ${LOGIN_BTN_LOCATOR}


Verify that the user is logged in
    [Arguments]                  ${locator}
    Page Should Contain Link     ${locator}


Verify that the error message is correct
    [Arguments]                  ${locator_name}           ${message}
    Element Text Should Be       ${ERROR_MSG_LOCATOR}      ${message}


