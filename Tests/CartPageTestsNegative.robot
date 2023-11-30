*** Settings ***
Library          SeleniumLibrary
Library          Collections
Test Setup       Open the Browser with URL
Test Teardown    Close Browser Session
Resource        ../Resources/GenericResources.robot
Resource        ../Resources/ProductResources.robot
Variables       ../Locators/cart_page_locators.py




*** Test Cases ***


Continue checkout with empty fields
    ProductResources.Go to the shopping cart
    Click Button                                                       ${CHECKOUT_BTN}
    SeleniumLibrary.Element Text Should Be                             ${TITLE}                   ${INFO_TITLE}
    Input Text                                                         ${FIRST_NAME}              ${EMPTY}
    Input Text                                                         ${LAST_NAME}               ${EMPTY}
    Input Text                                                         ${POSTAL_CODE_ID}          ${EMPTY}
    Click Button                                                       ${CONTINUE_BTN}
    Element Text Should Be                                             ${ERROR_MSG}               ${ERROR_EMPTY_FIELDS}


Continue checkout with empty last name and zip code
    ProductResources.Go to the shopping cart
    Click Button                                                        ${CHECKOUT_BTN}
    SeleniumLibrary.Element Text Should Be                              ${TITLE}                ${INFO_TITLE}
    Input Text                                                          ${FIRST_NAME}           ${USER_FIRST_NAME}
    Input Text                                                          ${LAST_NAME}            ${EMPTY}
    Input Text                                                          ${POSTAL_CODE_ID}       ${EMPTY}
    Click Button                                                        ${CONTINUE_BTN}
    Element Text Should Be                                              ${ERROR_MSG}            ${ERROR_EMPTY_LAST_NAME}


Continue checkout with empty zip code
    ProductResources.Go to the shopping cart
    Click Button                                                        ${CHECKOUT_BTN}
    SeleniumLibrary.Element Text Should Be                              ${TITLE}                ${INFO_TITLE}
    Input Text                                                          ${FIRST_NAME}           ${USER_FIRST_NAME}
    Input Text                                                          ${LAST_NAME}            ${USER_LAST_NAME}
    Input Text                                                          ${POSTAL_CODE_ID}       ${EMPTY}
    Click Button                                                        ${CONTINUE_BTN}
    Element Text Should Be                                              ${ERROR_MSG}            ${ERROR_EMPTY_ZIP_CODE}