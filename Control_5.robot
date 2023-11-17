*** Settings ***
Test Setup        Hello
Test Teardown     Goodbye
Force Tags        Control 5

*** Variables ***

*** Test Cases ***
Setup and Teardown
    [Tags]    Setup
    Log    'In the test'
    Variable Should Exist    ${boo}

Timeout
    [Tags]    Timeout
    [Timeout]    10 seconds
    Log    I am sleeping
    Sleep    15s
    [Teardown]    Run Keyword If Timeout Occurred    Sleep to long

Loop
    FOR    ${animal}    IN    cat    dog
        Log    ${animal}
    END
    FOR    ${index}    IN RANGE    1    11
        Log    ${index}
    END

IF
    ${animal}    Set variable    dog
    IF    '${animal}' == 'dog'
        log     yes
    ELSE
        log    no
    END

*** Keywords ***
Hello
    Log    Good morning

Goodbye
    log    Have a nice day

Sleep to long
    Log    You should get up
    Goodbye
