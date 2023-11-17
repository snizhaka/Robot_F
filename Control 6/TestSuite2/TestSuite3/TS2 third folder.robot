*** Settings ***
Test Tags         TS3

*** Test Cases ***
April
    [Tags]    Spring    High
    Log    April

May
    [Tags]    Spring    Smoke
    Variable should exist    ${year}
