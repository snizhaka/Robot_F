*** Settings ***
Test Tags         TS1

*** Test Cases ***
August
    [Tags]    Low    Summer
    Variable Should Exist    ${year}

September
    [Tags]    Autumn    Backend
    Log    September
