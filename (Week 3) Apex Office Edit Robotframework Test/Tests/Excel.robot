*** Settings ***
Library    SeleniumLibrary
Library    XML
Resource    Vars.robot

*** Test Cases ***
Login with correct Username and Password
    [Documentation]    This test will test the login with correct username and password
    [Tags]    Login
    Open Browser    url=${URL}    browser=${BROWSER}

    Set Window Size    1920    1080

    Wait Until Element Is Visible    xpath: //*[@placeholder='Your name']    timeout=10s
    Input Text    xpath: //*[@placeholder='Your name']    Jonas

    Wait Until Element Is Visible    xpath: //*[contains(text(), "Sign In")]/..    timeout=10s
    Click Button    xpath: //*[contains(text(), "Sign In")]/..

Start Excel
    [Documentation]    This test will test the start word
    [Tags]    Word
    Wait Until Element Is Visible   xpath: //*[contains(text(), "Microsoft Excel")]/..    timeout=10s
    Click Link    xpath: //*[contains(text(), "Microsoft Excel")]/..

Swap to file
    [Documentation]    This test will test the save buttons
    [Tags]    Save
    Wait Until Element Is Visible    xpath: //iframe[@title='Office Frame']    timeout=10s
    Select Frame    xpath: //iframe[@title='Office Frame']
    
    Wait Until Element Is Visible    xpath: //button[@aria-label='File']    timeout=10s
    Click Button    xpath: //button[@aria-label='File']

Test Save Buttons
    Wait Until Element Is Visible    xpath: //label[contains(text(), "Save")]/..    timeout=10s
    Click Button    xpath: //label[contains(text(), "Save")]/..

    Wait Until Element Is Visible    xpath: //label[contains(text(), "Save As")]/..    timeout=10s
    Click Button    xpath: //label[contains(text(), "Save As")]/..

    Unselect Frame

    Wait Until Element Is Visible    xpath: //input[@name='filename']    timeout=10s
    Input Text    xpath: //input[@name='filename']    Test

    Wait Until Element Is Visible    xpath: //span[contains(text(), "Save as")]/..    timeout=10s
    Click Button    xpath: //span[contains(text(), "Save as")]/..

    Wait Until Element Is Not Visible    class: uc-msgListener    timeout=10s

    Wait Until Element Is Visible    xpath: //iframe[@title='Office Frame']    timeout=10s
    Select Frame    xpath: //iframe[@title='Office Frame']

    Wait Until Element Is Not Visible    class: jsdialog ui-text    timeout=10s


Test Export Buttons
    [Documentation]    This test will test the export buttons
    [Tags]    Export
    Wait Until Element Is Visible    xpath: //label[contains(text(), "Export As")]/..    timeout=10s
    Click Button    xpath: //label[contains(text(), "Export As")]/..
    
    Wait Until Element Is Visible    xpath: //tr[@index="0"]    timeout=10s
    Execute Javascript    document.querySelector('tr[index="0"]').click()

    Unselect Frame

    Wait Until Element Is Visible    xpath: //input[@name='filename']    timeout=10s
    Input Text    xpath: //input[@name='filename']    Test

    Wait Until Element Is Visible    xpath: //span[contains(text(), "Save as")]/..    timeout=10s
    Click Button    xpath: //span[contains(text(), "Save as")]/..

    Wait Until Element Is Visible    xpath: //*[@data-lisener-name="saving the document as a new file"]
    Wait Until Element Is Not Visible    xpath: //*[@data-lisener-name="saving the document as a new file"]    timeout=10s
    
Test File Buttons
    [Documentation]    This test will test the file buttons
    [Tags]    File
    Wait Until Element Is Visible    xpath: //iframe[@title='Office Frame']    timeout=10s
    Select Frame    xpath: //iframe[@title='Office Frame']

    Wait Until Element Is Visible    xpath: //span[contains(text(), "ods")]/..    timeout=10s
    Click Button    xpath: //span[contains(text(), "ods")]/../button

    Wait Until Element Is Visible    xpath: //span[contains(text(), "csv")]/..    timeout=10s
    Click Button    xpath: //span[contains(text(), "csv")]/../button

    Wait Until Element Is Visible    xpath: //span[contains(text(), ".xls")]/..    timeout=10s
    Click Button    xpath: //span[contains(text(), ".xls")]/../button

    Wait Until Element Is Visible    xpath: //span[contains(text(), ".xlsx")]/..    timeout=10s
    Click Button    xpath: //span[contains(text(), ".xlsx")]/../button

Test PDF Buttons
    [Documentation]    This test will test the pdf buttons
    [Tags]    PDF
    Wait Until Element Is Visible    //span[contains(text(), "(.pdf)") and not(contains(text(), "- Expert"))]/../button
    Click Button    //span[contains(text(), "(.pdf)") and not(contains(text(), "- Expert"))]/../button

    Wait Until Element Is Visible   //span[contains(text(), "(.pdf) - Expert")]/../button
    Click Button    //span[contains(text(), "(.pdf) - Expert")]/../button
    
    Wait Until Element Is Visible    class: lokdialog_container

    Scroll Element Into View    xpath: //*[@class="access-key" and contains(text(), "x")]/../../button

    Wait Until Element Is Visible    xpath: //*[@class="access-key" and contains(text(), "x")]/../../button    timeout=10s
    Click Button    xpath: //*[@class="access-key" and contains(text(), "x")]/../../button

Test Repair Button
    [Documentation]    This test will test the repair button
    [Tags]    Repair
    Wait Until Element Is Visible    xpath: //*[contains(text(), "Repair")]/..    timeout=10s
    Click Button    xpath: //*[contains(text(), "Repair")]/..

    Wait Until Element Is Visible    class: lokdialog_container
    
    Click Button    xpath: //button[@class="ui-pushbutton jsdialog button-primary"]

Test Properties button
    [Documentation]    This test will test the properties button    
    [Tags]    Properties
    Wait Until Element Is Visible    xpath: //*[contains(text(), "Properties")]/..    timeout=10s
    Click Button    xpath: //*[contains(text(), "Properties")]/..
    
    Wait Until Element Is Visible    class: lokdialog_container

    Scroll Element Into View    xpath: //*[@class="access-key" and contains(text(), "O")]/..

    Wait Until Element Is Visible    xpath: //*[@class="access-key" and contains(text(), "O")]/..    timeout=10s
    Click Button    xpath: //*[@class="access-key" and contains(text(), "O")]/..

Test Rename button
    [Documentation]    This test will test the rename button
    [Tags]    Rename
    Wait Until Element Is Visible    xpath: //*[contains(text(), "Rename")]/..    timeout=10s
    Click Button    xpath: //*[contains(text(), "Rename")]/..

    Wait Until Element Is Visible    class: lokdialog_container

    Clear Element Text   css: .ui-grid-cell input
    Input Text    css: .ui-grid-cell input    Test

    Click Button    xpath: //button[@class="ui-pushbutton jsdialog button-primary"]

Swap To Home
    [Documentation]    This test will test the home button
    [Tags]    Home
    Wait Until Element Is Visible    xpath: //button[@aria-label="Home"]    timeout=10s
    Click Button    xpath: //button[@aria-label="Home"]