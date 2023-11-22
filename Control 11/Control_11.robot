*** Settings ***
Test Teardown     Delete all sessions
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections

*** Test Cases ***
Get
    Create Session    httpbin    https://httpbin.org
    ${result}    Get on Session    httpbin    /anything
    ${result_str}    Convert to string    ${result.json()}
    Should contain    ${result_str}    'json': None, 'method': 'GET'

Get with params
    Create Session    httpbin    https://httpbin.org
    ${result}    Get on Session    httpbin    /get    params=param=text
    Should contain    ${result.text}    "param1": "text"

Get with headers
    Create Session    httpbin    https://httpbin.org
    ${list_headers}    Create List    Host    Date
    ${result}    Get on Session    httpbin    /anything    params=headers=${list_headers}
    ${content_type_value}    Get From Dictionary    ${result.headers}    Content-Type
    should be equal    ${content_type_value}    application/json
    ${headers_str}    convert to string    ${result.json()['args']}
    should contain    ${headers_str}    '${list_headers[0]}', '${list_headers[1]}'

Get timeout
    [Timeout]    100 milliseconds
    Create Session    httpbin    https://httpbin.org    max_retries=0
    ${result}    Get on Session    httpbin    /delay/3

    [Teardown]    Run Keyword If Timeout Occurred    Fail    Timeout occurred, you should add more sec

Delete
    Create Session    httpbin    https://httpbin.org
    ${result}    DELETE on Session    httpbin    /delete    expected_status=200

Authorization
    ${auth}    Create List    student    111
    Create Session    httpbin    https://httpbin.org    auth=${auth}
    ${result}    Get on Session    httpbin    /basic-auth/student/111
    ${authenticated}    Get From Dictionary    ${result.json()}    authenticated
    ${user}    Get From Dictionary    ${result.json()}    user
    Should Be Equal    ${authenticated}    ${True}
    Should Be Equal    ${user}    ${auth[0]}

Post
    ${params}    Set variable    {"user": "schuiko", "day": "wednesday"}
    ${params_json}    Convert String To Json    ${params}
    Create Session    httpbin    https://httpbin.org
    ${result}    Post on session    httpbin    /post    json=${params_json}
    Should Be Equal    ${result.json()['json']}    ${params_json}
