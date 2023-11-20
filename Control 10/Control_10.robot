*** Settings ***
Library           DatabaseLibrary

*** Variables ***
${DBname}         demo_database
${DBuser}         root
${DBpass}         1
${DBhost}         localhost
${DBport}         3306

*** Test Cases ***
Test 1
    Connect to database    dbConfigFile=dbconfig.txt
    Select age
    Check if not Exists in database    Select * from demo1 where salary = 0;
    [Teardown]    Disconnect from database

Test 2
    Connect To Database    pymysql    ${DBname}    ${DBuser}    ${DBpass}    ${DBhost}    ${DBport}
    Execute sql string    Delete from demo1;
    Row Count Is 0    Select * from demo1;
    [Teardown]    Disconnect From Database

Test 3
    Connect to Database Using Custom Params    pymysql    database='${DBname}', user='${DBuser}', password='${DBpass}', host='${DBhost}'
    Insert data
    Row Count is Equal to X    Select * from demo1;    10
    [Teardown]    Disconnect from database

*** Keywords ***
Insert data
    ${result}    Execute sql script    ./data_for_demo1.sql
    Log    ${result}

Select age
    ${result}    Query    Select name, surname from demo1 where age < 7;
    log    people who yonger than 7 ${result}
