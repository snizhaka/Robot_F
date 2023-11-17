*** Settings ***
Suite Setup       Login to Remote Host
Suite Teardown    Exit From Remote Host
Force Tags        Global
Resource          ../Resource Files/Control 5 testing.txt
Library           BuiltIn

*** Variables ***
&{configurations}    host=www.google.com    username=boom    password=pong

*** Test Cases ***
UI testing
    [Tags]    UI    smoke
    [Timeout]    1 minute
    ${check result}    Verify UI
    IF    "${check result}" == "FAILED"
        Set tags    UI_Error
    ELSE
        Set tags    No_Errors
    END

Backend testing
    [Tags]    backend
    [Setup]    Backup Configuration
    @{config_param}    Create List    host    username    password
    FOR    ${index}    IN    @{config_param}
        Edit Config    ${index}
    END
    ${result_check}    Verify backend
    IF    '${result_check}'=='PASSED'
        Set tags    Backend_Error
    END
    [Teardown]    Restore Configuration

CLI testing
    [Tags]    CLI
    FOR    ${index}    IN RANGE    1    6
        Run    mkdir
        Log    robot_${index}
    END
    [Teardown]    RUN    rm

*** Keywords ***
