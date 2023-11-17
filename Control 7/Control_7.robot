*** Settings ***
Library           OperatingSystem
Library           BuiltIn
Library           Process

*** Test Cases ***
First
    Create File    ~/hello.py    print("Good evening ")
    Run    chmod 755 ~/hello.py
    ${rc}    ${output}    Run And Return Rc And Output    python3 ~/hello.py
    Should Be Equal    ${rc}    ${0}
    ${rc}    ${output}    Run And Return Rc And Output    python3 ~/hello.py
    Append to file    ~/output.txt    ${output}
    ${error}    Grep File    ~/output.txt    ERROR
    Should be empty    ${error}
    Copy File    ~/output.txt    /tmp/output.txt
    File should exist    /tmp/output.txt
    Create directory    ~/src
    Directory should exist    ~/src
    Move file    ~/hello.py    ~/src
    ${dir_list}    Run    ls ~/src
    Log to console    ${dir_list}

Third
    ${rc}    ${output}    Run and return rc and output    cd /tmp
    #${rc}    ${output}    Run and return rc and output    cd ~/Robot_tests/'Control 7'/tmp
    ${rc2}    ${stdout2}    Run and return rc and output    ls
    log to console    ${stdout2}
    log to console    ${output}

Second
    ${result}    Run Process    grep    Level: error    /var/log/system.log
    Should be equal    ${result.rc}    ${0}
    Should not be empty    ${result.stdout}
    ${process}    Start Process    cat    /var/log/system.log    alias=cat
    Wait for Process    cat    0.1s
    Terminate process    cat    kill=True
    ${result_proc}    Get Process Result
    Log to console    ${result_proc.rc}
    Log to console    ${result_proc.stdout}
