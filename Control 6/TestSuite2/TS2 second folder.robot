*** Settings ***
Test Tags         TS2

*** Test Cases ***
December
    [Tags]    Winter    Low
    Log    December

January
    [Tags]    High    Winter
    Variable should exist    ${year}
