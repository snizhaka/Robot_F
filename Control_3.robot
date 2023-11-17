*** Settings ***
Library           Collections
Library           OperatingSystem
Library           Process

*** Variables ***
${LESSON}         ${3}
${ABOUT}          Variables
@{ANIMALS}        dog    cat    cow
&{APARTMENT}      number=1    name=Oleg

*** Test Cases ***
Scalar
    Log to console    Lesson ${LESSON} About ${ABOUT}
    Log to console    CREATE NEW VAR
    ${doctor}    Set Variable    Chuiko
    Log to console    ${doctor}
    ${doctor_check}    Set Variable if    "${doctor}"=="Chuiko"    Snizhana
    Log to console    ${doctor_check}
    Log to console    OWERWRITE WAR
    ${weather}    Set Variable    sunshine
    log to console    ${weather}
    ${weather}    Set Variable    rain
    log to console    ${weather}
    Log to console    APPEND TO VAR
    ${song}    Set Variable    jingle bells
    log to console    ${song}
    ${song}    Set Variable    ${song} jingle all the way
    log to console    ${song}
    Log to console    CHECK FOR VAR
    ${check}    Set Variable    2023
    Variable Should Exist    ${check}
    Variable Should Not Exist    ${food}

List
    Log Many    @{ANIMALS}
    Log to console    ${ANIMALS}[0]
    log    ${ANIMALS}
    Log Many    onion    cucumber    tomato
    Log Many    ${ANIMALS}
    Log    CREATE FROM TEST
    @{numbers}    Create List    ${2}    ${3}    ${6}
    ${words}    Create List    one    two    zero
    ${text}    Create List    seven    nine    four
    Log Many    @{numbers}
    Log Many    ${words}
    Log Many    ${text}
    Log    UPDATE PREVIOUS LISTS
    Append To List    ${words}    new
    Log    ${words}
    ${Combined}    Combine Lists    ${text}    ${words}
    Log    INSERT
    Insert into list    ${text}    2    google
    Log    ${text}
    Log    DELETE
    Remove from list    ${text}    2
    Log    ${text}
    Log    SET VALUE
    SET LIST VALUE    ${text}    2    google
    Log    ${text}

Dictionary
    log many    &{APARTMENT}
    log    ${APARTMENT}
    &{sport}=    Create Dictionary    name=Stepan    sport=football
    log    ${sport}
    log many    &{sport}
    log    ******************
    &{var} =    Evaluate    {'key': 'value', 'nested': {'key': 'value'}}
    log    ${var}
    log many    &{var}
    log    *******************
    &{nest_dict} =    Create Dictionary    key=value    nested=${var}
    log    ${nest_dict.nested}
    log to console    ${nest_dict.nested}[key]
    log many    &{nest_dict}
    log    SET
    Set To Dictionary    ${sport}    mounth    december
    log    ${sport}
    log    POP
    ${Value}    Pop From Dictionary    ${sport}    mounth
    log    ${sport}
    log    REMOVE
    Remove From Dictionary    ${sport}    name
    log    ${sport}

More_var
    log    %{USER}
    ${var}    Get Environment Variable    USER
    log    ${var}

