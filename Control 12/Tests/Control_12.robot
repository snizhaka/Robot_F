*** Settings ***
Library           ../Libraries/MyLibrary.py

*** Variables ***
${expected_md5}    99ca34cb63951b0c4c8a44eb331b048b

*** Test Cases ***
Use own library
    ${path_directory}    Set Variable    /Users/schuiko/Robot_tests/Control 12
    ${path_file}    Set Variable    /Users/schuiko/Robot_tests/Control 12/mathematical_operations.py
    ${file_name}    Set Variable    mathematical_operations.py
    ${content_of_directory}    Content of directory    ${path_directory}
    ${exists}    File exists    ${content_of_directory}    ${file_name}
    Should be equal    ${exists}    ${True}
    ${actual_md5}    Calculate ${path_file} md5
    ${same}    Compare    ${actual_md5}    ${expected_md5}
    Should be equal    ${same}    ${True}
