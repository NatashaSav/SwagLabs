*** Settings ***

Library          SeleniumLibrary
Library          Collections
Test Setup       Open the Browser with URL
Test Teardown    Close Browser Session
Variables       ../Locators/login_page_locators.py
Resource        ../Resources/LoginResources.robot
Resource        ../Resources/GenericResources.robot


*** Variables ***
@{items}=       class:inventory_list


*** Tasks ***
Execute a for loop only three times
    LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
    @{elementList}=  Get WebElements  //div[@class='inventory_list']/div[@class='inventory_item']
    FOR   ${item}   IN    @{elementList}
        ${name}=    Get Text    ${item}
        ${web_element}=    Get WebElements  ${item}
        Wait until page contains element  ${item}/[contains(@class, '$inventory_item_name')]
        Log    ${name}
        Log    ${web_element}
        Log    1
    END


#*** Test Cases ***
#
#Verify that page has logo
#    LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
#    Title Should Be                                         Swag Labs
#
#Sorting carts by name from a to z
#   LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
#   Select From List By Value                               class:product_sort_container      az
#   List Selection Should Be                                class:product_sort_container      Name (A to Z)
#
#
#Sorting carts by name from z to a
#   LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
#   Select From List By Value                               class:product_sort_container      za
#   List Selection Should Be                                class:product_sort_container      Name (Z to A)
#
#
#Sorting carts by price from low to high
#   LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
#   Select From List By Value                               class:product_sort_container      lohi
#   List Selection Should Be                                class:product_sort_container      Price (low to high)
#
#
#Sorting carts by price from high to low
#   LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
#   Select From List By Value                               class:product_sort_container      hilo
#   List Selection Should Be                                class:product_sort_container      Price (high to low)
#
#
#Verify that title is on each cart
#   LoginResources.Fill the login form                      ${STANDARD_USER_NAME}             ${CORRECT_PASSWORD}
#    @{elementList}=  Get WebElements  class:inventory_list
#    @{textList}=    Create List
#    FOR  ${element}  IN  @{elementList}
#         ${text}=  Get Text  ${element}
#         Append To List  ${textList}  ${text}
#    END
#    Log To Console  \n List from WebPage:
#    Log To Console  ${textList}
##    Log To Console  Our List:
##    Log To Console  ${quickLaunchList}
##    Lists Should Be Equal  ${textList}  ${quickLaunchList}
#
#
