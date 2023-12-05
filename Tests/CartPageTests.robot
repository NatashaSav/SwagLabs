*** Settings ***
Library          SeleniumLibrary
Library          Collections
Test Setup       Open the Browser with URL
Test Teardown    Close Browser Session
Resource        ../Resources/GenericResources.robot
Resource        ../Resources/ProductResources.robot
Variables       ../Locators/cart_page_locators.py



*** Test Cases ***


Make order
     ProductResources.Overview created order
     Click Button                                            ${FINISH_BTN}
     SeleniumLibrary.Element Text Should Be                  ${TITLE}                   ${COMPLETE_TITLE}
     Page Should Contain                                     ${COMPLETE_TEXT}
     Click Button                                            ${BACK_HOME_BTN}
     ProductResources.Verify current url                     ${INVENTORY_URL}


Cancel cart overview
    ProductResources.Overview created order
    Click Button                                             ${CANSEL_BTN}
    ProductResources.Verify current url                      ${INVENTORY_URL}


Check button "Continue shopping"
    ProductResources.Go to the shopping cart
    Click Button                                             ${CONTINUE_SHOPPING_BTN}
    ProductResources.Verify current url                      ${INVENTORY_URL}



Remove item from the cart
     ProductResources.Go to the shopping cart
     Click Button                                            ${REMOVE_BTN}
     Page Should Not Contain Element                         ${REMOVE_BTN}