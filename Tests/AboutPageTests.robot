*** Settings ***
Library          SeleniumLibrary
Library          Collections
Test Setup       Open the Browser with URL
Test Teardown    Close Browser Session
Resource        ../Resources/GenericResources.robot
Resource        ../Resources/ProductResources.robot
Variables       ../Locators/cart_page_locators.py
Variables       ../Locators/about_page_locators.py





*** Test Cases ***

Check that About button is clickable
    LoginResources.Fill the login form           ${STANDARD_USER_NAME}    ${CORRECT_PASSWORD}
    Click Button                                 ${BURGER_BTN}
    Click Element                                ${ABOUT_BTN}
    ProductResources.Verify current url          ${SAUCE_LABS_URL}
    Page Should Contain Image                    ${LOGO_IMG}



