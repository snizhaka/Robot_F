*** Settings ***
Library           SSHLibrary

*** Variables ***
${destination_for_copy}    /Users/schuiko/demo.txt
${user}           root
${password}       root
${tmp}            /tmp
${destination_to_file}    /tmp/demo.txt
${host}           localhost
${port}           2222
${text}           text
${file_name}      demo.txt

*** Test Cases ***
Connection to remote host
    ${connection_id_1}    Open Connection    ${host}    port=${port}    alias=connection_1
    ${connection_info}    Get Connection
    ${hello}    Login    ${user}    ${password}    delay=1s
    Start Command    cd ${tmp}
    Start Command    echo This is a text file > \ ${destination_to_file}
    ${directory_content}    List Directory    ${tmp}
    Should contain    ${directory_content}    ${file_name}
    Get File    ${destination_to_file}    ${destination_for_copy}
    ${connection_id_2}    Open Connection    ${host}    port=${port}    alias=connection_2
    ${connection_info_2}    Get Connection
    ${stdout_2}    Login    ${user}    ${password}    delay=1s
    #${stdout_2}    Login With Public Key    root    /Users/schuiko/.ssh/id_rsa    delay=2s
    Write    cat ${destination_to_file}
    ${result_of_reading}    Read Until    ${text}
    Should Be Equal    ${result_of_reading}    This is a text
    Switch Connection    connection_1
    Execute Command    rm ${destination_to_file}
    Switch Connection    connection_2
    File Should Not Exist    ${destination_to_file}
    [Teardown]    Close All Connections

test conection
    ${connection_id_1}    Open Connection    ${host}    port=${port}    alias=connection_1
    ${connection_info}    Get Connection
    ${stdout_2}    Login With Public Key    root    /Users/schuiko/.ssh/authorized_key    delay=2s
    #${stdout_2}    Login    ${user}    ${password}    delay=1s
