*** Settings ***

Library          SeleniumLibrary
Test Setup       Open the Browser with URL
Test Teardown    Close Browser Session
Variables        ../Locators/base_locators.py
Variables        ../Locators/login_page_locators.py
Resource         ../Resources/LoginResources.robot
Resource         ../Resources/GenericResources.robot


*** Test Cases ***

Login for user with incorrect password
    LoginResources.Fill the login form                         ${STANDARD_USER_NAME}      ${INCORRECT_PASSWORD}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}       ${ERROR_MSG_TEXT}


Login for user with incorrect username
    LoginResources.Fill the login form                         ${ORDINARY_USER}           ${CORRECT_PASSWORD}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}       ${ERROR_MSG_TEXT}


Login with short username and correct password
    LoginResources.Fill the login form                         ${SHORT_USERNAME}           ${CORRECT_PASSWORD}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}        ${ERROR_MSG_TEXT}


Login with short password and correct username
    LoginResources.Fill the login form                         ${STANDARD_USER_NAME}       ${SHORT_PASSWORD}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}        ${ERROR_MSG_TEXT}


Login with long username and correct password
    LoginResources.Fill the login form                         ${LONG_USERNAME}            ${CORRECT_PASSWORD}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}        ${ERROR_MSG_TEXT}


Login with long password and correct username
    LoginResources.Fill the login form                         ${USER_WITH_GLITCH_NAME}    ${LONG_PASSWORD}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}        ${ERROR_MSG_TEXT}


Login with sql injection for username and correct password
    LoginResources.Fill the login form                         ${SQL_INJECTION_USERNAME}   ${CORRECT_PASSWORD}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}        ${ERROR_MSG_TEXT}


Login with html tag for username and correct password
    LoginResources.Fill the login form                         ${USERNAME_WITH_HTML_TAG}   ${CORRECT_PASSWORD}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}        ${ERROR_MSG_TEXT}


Login with correct username and password with special characters
    LoginResources.Fill the login form                         ${STANDARD_USER_NAME}       ${PASSWORD_WITH_SPECIAL_CHR}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}        ${ERROR_MSG_TEXT}


Login with empty username and correct password
    LoginResources.Fill the login form                         ${EMPTY}                     ${CORRECT_PASSWORD}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}         ${EMPTY_USERNAME_ERROR_MSG}


Login with correct username and empty password
    LoginResources.Fill the login form                         ${VISIAL_USER}               ${EMPTY}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}         ${EMPTY_PASSWORD_ERROR_MSG}


Login with empty username and password
    LoginResources.Fill the login form                         ${EMPTY}                     ${EMPTY}
    LoginResources.Verify that the error message is correct    ${ERROR_MSG_LOCATOR}         ${EMPTY_USERNAME_ERROR_MSG}

