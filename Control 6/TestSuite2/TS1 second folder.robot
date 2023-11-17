*** Settings ***
Test Tags         TS2

*** Test Cases ***
October
    [Tags]    Autumn    Smoke
    Log    October

November
    [Tags]    Autumn    Failed
    Variable Should Exist    ${year}
