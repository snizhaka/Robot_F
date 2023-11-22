*** Settings ***
Library           BuiltIn
Library           OperatingSystem

*** Test Cases ***
Lesson_1
    Log    Hello, World!
    Log    Hello, console    console=True
    Log to console    Good evening

Lesson_2
    ${Price}=    Set variable    50
    ${Discount}=    Set variable if    ${Price}==100    5    0
    ${Price_int}=    Convert to integer    ${Price}
    ${Discount_int}=    Convert to integer    ${Discount}
    ${Total_price}=    Evaluate    ${Price_int} - ${Discount_int}
    Log    Total price is ${Total_price}
    ${rc}    Print    Hello
    Should Be Equal    ${rc}    1


*** Keywords ***
Print
    [Arguments]    ${arg1}
    Log    ${arg1}
    [Return]    1
