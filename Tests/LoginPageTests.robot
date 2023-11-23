*** Settings ***

Library          SeleniumLibrary
Test Setup       Open the Browser with URL
Test Teardown    Close Browser Session
Variables       ../Locators/login_page_locators.py
Resource        ../Resources/LoginResources.robot
Resource        ../Resources/GenericResources.robot

*** Test Cases ***


Successful login for standard user
    LoginResources.Fill the login form                      ${STANDARD_USER_NAME}      ${CORRECT_PASSWORD}
    LoginResources.Verify that the user is logged in        ${CART_LINK}



Successful login for user with glitch
    LoginResources.Fill the login form                      ${USER_WITH_GLITCH_NAME}      ${CORRECT_PASSWORD}
    LoginResources.Verify that the user is logged in        ${CART_LINK}



Successful login for problem user
    LoginResources.Fill the login form                       ${PROBLEM_USER}      ${CORRECT_PASSWORD}
    LoginResources.Verify that the user is logged in         ${CART_LINK}



Successful login for locked user
    LoginResources.Fill the login form                        ${LOCKED_USER}      ${CORRECT_PASSWORD}
    LoginResources.Verify that the error message is correct   ${LOCKED_USER}      ${ERROR_MSG_FOR_LOCKED_USER}



Successful login for error user
    LoginResources.Fill the login form                         ${ERROR_USER}      ${CORRECT_PASSWORD}
    LoginResources.Verify that the user is logged in           ${CART_LINK}



Successful login for visual user
    LoginResources.Fill the login form                         ${VISIAL_USER}      ${CORRECT_PASSWORD}
    LoginResources.Verify that the user is logged in           ${CART_LINK}




