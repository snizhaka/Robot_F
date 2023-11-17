*** Settings ***
Test Tags         TS3

*** Test Cases ***
February
    [Tags]    Winter    Low    TS3
    Variable Should Exist    ${year}

March
    [Tags]    Spring    UI    TS3
    log    March
