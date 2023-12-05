*** Settings ***

Library          SeleniumLibrary
Library          Collections
Test Setup       Open the Browser with URL
Test Teardown    Close Browser Session
Variables       ../Locators/login_page_locators.py
Variables       ../Locators/products_page_locators.py
Resource        ../Resources/LoginResources.robot
Resource        ../Resources/GenericResources.robot
Resource        ../Resources/ProductResources.robot


*** Test Cases ***


Сheck the number of titles for product cards
                      LoginResources.Fill the login form     ${STANDARD_USER_NAME}          ${CORRECT_PASSWORD}
   ${title_link}=     SeleniumLibrary.Get Element Count      ${TITLE_LINK}
                      Should Be Equal As Integers            ${title_link}                  ${ITEM_COUNT}


Сheck the number of description for product cards
                      LoginResources.Fill the login form     ${STANDARD_USER_NAME}          ${CORRECT_PASSWORD}
   ${description}=    SeleniumLibrary.Get Element Count      ${DESCRIPTION}
                      Should Be Equal As Integers            ${description}                  ${ITEM_COUNT}


Сheck the number of prices for product cards
                       LoginResources.Fill the login form     ${STANDARD_USER_NAME}          ${CORRECT_PASSWORD}
   ${prices}=          SeleniumLibrary.Get Element Count      ${PRICE}
                       Should Be Equal As Integers            ${prices}                      ${ITEM_COUNT}


Сheck the number of "add to cart" button for product cards
                       LoginResources.Fill the login form     ${STANDARD_USER_NAME}          ${CORRECT_PASSWORD}
  ${add_to_cart_btn}=  SeleniumLibrary.Get Element Count      ${ADD_TO_CART}
                       Should Be Equal As Integers            ${add_to_cart_btn}             ${ITEM_COUNT}


Check links for burger button
    LoginResources.Fill the login form                        ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
    Click Button                                              ${BURGER_BTN}
    Page Should Contain Link                                  ${ABOUT_BTN}
    Page Should Contain Link                                  ${ALL_ITEMS_BTN}
    Page Should Contain Link                                  ${LOGOUT}
    Page Should Contain Link                                  ${RESET_APP_STATE_BTN}


Check "Add to cart" button is clickable
    LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
    Click Button                                            ${ADD_LABS_BACKPACK}
    Element Should Contain                                  ${REMOVE_LABS_BACKPACK}           Remove
    Element Should Contain                                  ${CART_BADGE}                     1


Check that product cart is clickable
    LoginResources.Fill the login form                      ${STANDARD_USER_NAME}           ${CORRECT_PASSWORD}
    Click Element                                           ${SAUCE_LABS_BIKE_LIGHT}
    ${url}=   Get Location
    Should Be Equal As Strings                              ${url}                          ${SAUCE_LABS_BIKE_LIGHT_URL}
    Click Button                                            ${BACK_TO_PRODUCTS_BTN}
    SeleniumLibrary.Element Text Should Be                  ${TITLE}                        Products


Verify that page has logo
    LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
    Title Should Be                                         Swag Labs


Sorting carts by name from a to z
   LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
   Select From List By Value                               ${PRODUCT_SORT}                   az
   List Selection Should Be                                ${PRODUCT_SORT}                   Name (A to Z)


Sorting carts by name from z to a
   LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
   Select From List By Value                               ${PRODUCT_SORT}                   za
   List Selection Should Be                                ${PRODUCT_SORT}                   Name (Z to A)


Sorting carts by price from low to high
   LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
   Select From List By Value                               ${PRODUCT_SORT}                   lohi
   List Selection Should Be                                ${PRODUCT_SORT}                   Price (low to high)


Sorting carts by price from high to low
   LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
   Select From List By Value                               ${PRODUCT_SORT}                   hilo
   List Selection Should Be                                ${PRODUCT_SORT}                   Price (high to low)


Logout of Swag Labs
   LoginResources.Fill the login form                     ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
   Click Button                                           ${BURGER_BTN}
   Click Element                                          ${LOGOUT}
   ProductResources.Verify current url                    ${WEBSITE_URL}


Reset App State of Swag Labs
   LoginResources.Fill the login form                     ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
   Click Element                                          ${SAUCE_LABS_BACKPACK_BTN}
   Element Should Contain                                 ${CART_BADGE}                     1
   Click Button                                           ${BURGER_BTN}
   Click Element                                          ${RESET_APP_STATE_BTN}
   ${msg}=    Run Keyword And Expect Error    *           Page Should Not Contain Button    ${REMOVE_BTN}
   Should Contain                                         ${msg}                            ${ERROR_MSG}
