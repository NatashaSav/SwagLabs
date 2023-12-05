*** Settings ***

Library    SeleniumLibrary
Library    ../lib/CustomLib.py
Variables  ../Locators/login_page_locators.py

*** Keywords ***

Fill the login form
   [Arguments]                   ${username}                 ${password}
   Input Text                    ${USER_NAME_LOCATOR}        ${username}
   Input Password                ${PASSWORD_LOCATOR}         ${password}
   Click Button                  ${LOGIN_BTN_LOCATOR}


Fill out the authorization form with the generated email
   ${random_email}               Generate Random Emails       ${8}
   Input Text                    ${USER_NAME_LOCATOR}         ${random_email}
   Input Password                ${PASSWORD_LOCATOR}          ${CORRECT_PASSWORD}
   Click Button                  ${LOGIN_BTN_LOCATOR}


Verify that the user is logged in
    [Arguments]                  ${locator}
    Page Should Contain Link     ${locator}


Verify that the error message is correct
    [Arguments]                  ${locator_name}              ${message}
    Element Text Should Be       ${ERROR_MSG_LOCATOR}         ${message}


