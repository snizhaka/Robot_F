*** Settings ***
Test Tags         TS1

*** Test Cases ***
June
    [Tags]    Summer    UI
    Log    June

July
    [Tags]    Summer    High
    Variable Should Exist    ${year}
