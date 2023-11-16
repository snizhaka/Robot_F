*** Settings ***
Library           BuiltIn
Library           /Users/schuiko/Robot_tests/mathematical_operations.py

*** Variables ***
${discount_1}     ${5}
${discount_2}     ${0}
${price_1}        ${100}
${price_2}        ${50}

*** Test Cases ***
Purchase
    ${discount_price_1}    Discount price    ${price_1}
    ${discount_price_2}    Discount price    ${price_2}
    ${total_price}    Toral price    ${discount_price_1}    ${discount_price_2}
    Discount sum    ${total_price}

*** Keywords ***
Discount price
    [Arguments]    ${var}
    [Documentation]    Keyword help to find out price with discount
    ...
    ...    Parameter:
    ...    - *var* - value of price
    ${discount}    Set Variable if    ${var} ==100    ${discount_1}    ${discount_2}
    ${discount_price}    subtract    ${var}    ${discount}
    Log to console    Discount price ${discount_price}
    [Return]    ${discount_price}

Toral price
    [Arguments]    ${discount_price_1}    ${discount_price_2}
    [Documentation]    Keyword help to find out sum of price with discount
    ...
    ...    Parameter:
    ...
    ...    - *discount_price_1* - value of price for first product
    ...    - *discount_price_2* - value of price for second product
    ${total_price}    Add    ${discount_price_1}    ${discount_price_2}
    Log to console    Total price ${total_price}
    [Return]    ${total_price}

Discount sum
    [Arguments]    ${total_price}
    [Documentation]    Keyword help to find out discount sum
    ...
    ...    Parameter:
    ...    - *total_price* - sum of price with discount
    ${total_sum}    add    ${price_1}    ${price_2}
    ${discount_sum}    subtract    ${total_sum}    ${total_price}
    log to console    Sum of discount ${discount_sum}
