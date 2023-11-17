*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Work with browser
    set selenium speed    0.5
    Open Browser    http://commentssprintone.azurewebsites.net    Firefox
    Title should be    Index
    Click element    //*[@id="command-navigation"]/input[2]    #Edit
    Alert should be present    Please, select one category
    Click element    //*[@id="SelectedCateg"]/option[5]    #select cat4 category name
    Click button    id:applybutton    #Apply
    Table cell should contain    //*[@id="main"]/div/div[5]/form/table    2    2    4
    Select checkbox    //*[@id="main"]/div/div[5]/form/table/tbody/tr[1]/td[1]/input[1]
    Checkbox should be selected    //*[@id="main"]/div/div[5]/form/table/tbody/tr[1]/td[1]/input[1]
    Click element    //*[@id="command-navigation"]/input[2]    #Edit
    Input text    id:Text    My new comment from RF
    Unselect checkbox    id:Active
    Select checkbox    id:Categories    #cat5
    Click button    //*[@id="categoryselector"]/div[2]/input[2]    #button >
    Click element    //*[@id="editor-navigation"]/input[2]    #save&return
    Click element    //*[@id="SelectedStatus"]/option[3]    #select inactive status
    Click button    id:applybutton    #Apply
    Table Should contain    //*[@id="main"]/div/div[5]/form    My new comment from RF    loglevel=TRACE
    Close browser
