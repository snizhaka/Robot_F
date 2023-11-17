*** Settings ***
Library           BuiltIn
Library           ../Libraries/mathematical_operations.py
Resource          ../Resource Files/Calculated_discount.txt

*** Variables ***

*** Test Cases ***
Purchase
    ${discount_price_1}    Discount price    ${price_1}
    ${discount_price_2}    Discount price    ${price_2}
    ${total_price}    Toral price    ${discount_price_1}    ${discount_price_2}
    Discount sum    ${total_price}
