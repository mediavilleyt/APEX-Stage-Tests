*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${URLlogin}   https://apex.vvanhecke.be/ords/f?p=131:100:9521489571363:::::
${URLHOME}    https://apex.vvanhecke.be/ords/f?p=131:100:17312384095758:::::

${BROWSER}                 Chrome
#${iframe_locator}          css=iframe#ucaoe-iframe-ui-id-3
# This is a variable to find an element that contains a certain text
${Contains}    [contains(text(), "{}")]/..
*** Keywords ***

*** Test Cases ***
open the home page 
    [Documentation]    Opens browser to the home page
    Open Browser    ${URLlogin}
    Input Text    xpath: //*[@placeholder='Your name']    marie
    Click Button    xpath: //*[contains(text(), "Sign In")]/..

open document text
    [Documentation]    open browser for the open document text
    Click Link    xpath: //*${Contains.format("Open Document Text")}


#test in open document text    
#    [Documentation]    write words, letters, numbers,...
#    Select Frame    //*[@id="map"]/iframe[1]
#    Select Frame    id="doc-clipboard-container"
#    Input Text      id="doc-clipboard-container"    test 
#    Input Text      id="doc-clipboard-container"    hallo wereld!
#    Input Text      id="doc-clipboard-container"    AbC  
#    Input Text      id="doc-clipboard-container"    123    
  
Test office frame features
    [Documentation]    test all the features of the home 
    Select Frame    xpath: //iframe[@title='Office Frame']
    Wait Until Element Is Visible    xpath: //button[@aria-label='File']
    Click Button    xpath: //button[@aria-label='File']
    Click Button    xpath: //label[contains(text(), "Save")]/..
    Click Button    xpath: //label[contains(text(), "Save As")]/..
    Unselect Frame
    Input Text    xpath: //input[@name='filename']    test_document
    Click Button    xpath: //span[contains(text(), "Save as")]/..
    Select Frame    xpath: //iframe[@title='Office Frame']
    Click Button    xpath: //label[contains(text(), "Export As")]/..

#Select Frame  ${iframe_locator}

    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "Home")]
    
    Wait Until Element Is Visible    xpath://[@title = "Undo"]
    Click Element    locator = xpath://[@title = "Undo"]

    Wait Until Element Is Visible    locator = xpath://[@title = "Redo"]
    Click Element    locator = xpath://[@title = "Redo"]

test 