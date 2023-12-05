*** Settings ***

Library    SeleniumLibrary
Resource        ../Resources/LoginResources.robot
Variables       ../Locators/products_page_locators.py
Variables       ../Locators/cart_page_locators.py

*** Keywords ***


Verify current url
    [Arguments]                                                                                      ${current_url}
    ${url}=   Get Location
    Should Match Regexp                                                    ${url}                    ${current_url}


Go to the shopping cart
    LoginResources.Fill the login form                                      ${STANDARD_USER_NAME}    ${CORRECT_PASSWORD}
    Click Element                                                           ${SAUCE_LABS_BACKPACK_BTN}
    Double Click Element                                                    ${SHOPPING_CART_LINK}
    ProductResources.Verify current url                                     ${SHOPPING_CART_URL}


Verify the item has been added to the shopping cart
    [Arguments]                                                             ${item_name}            ${quantity}
    ProductResources.Go to the shopping cart
    SeleniumLibrary.Element Text Should Be                                  ${ITEM_TITLE}           ${item_name}
    Element Should Contain                                                  ${CART_QUANTITY}        ${quantity}


Overview created order
     ProductResources.Verify the item has been added to the shopping cart    Sauce Labs Backpack    1
     Click Button                                                            ${CHECKOUT_BTN}
     SeleniumLibrary.Element Text Should Be                                  ${TITLE}               ${INFO_TITLE}
     Input Text                                                              ${FIRST_NAME}          ${USER_FIRST_NAME}
     Input Text                                                              ${LAST_NAME}           ${USER_LAST_NAME}
     Input Text                                                              ${POSTAL_CODE_ID}      ${POSTAL_CODE_VALUE}
     Click Button                                                            ${CONTINUE_BTN}
     SeleniumLibrary.Element Text Should Be                                  ${TITLE}               ${OVERVIEW_TITLE}
     Page Should Contain Element                                             ${PAYMENT_INFO}
     Page Should Contain Element                                             ${SUMMARY_FIRST_VALUE}
     Page Should Contain Element                                             ${SHIPPING_INFO}
     Page Should Contain Element                                             ${SUMMARY_LAST_VALUE}
     Page Should Contain Element                                             ${PRICE_TOTAL}
     Page Should Contain Element                                             ${SUMMARY_SUBTOTAL}
     Page Should Contain Element                                             ${SUMMARY_TOTAL}

