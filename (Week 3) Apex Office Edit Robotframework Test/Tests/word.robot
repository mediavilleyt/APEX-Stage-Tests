*** Settings ***
Library           SeleniumLibrary
*** Variables ***
#starting
${URL}                     https://apex.vvanhecke.be/ords/f?p=131:100:9521489571363:::::
${login_name}              keanu
${BROWSER}                 Chrome
${sign_in_button_locator}  class = t-Button--hot
${iframe_locator}          css=iframe#ucaoe-iframe-ui-id-3
*** Test Cases ***

Open login page
    [Documentation]    Opens browser to the login page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text   css = #P9999_USERNAME  ${login_name}
    Click Button    ${sign_in_button_locator} 
    Sleep   3
    Click Element    xpath = //*[@class = "uc-aoe-newFile-a-docx"]

    Select Frame      ${iframe_locator}
Navigate to the Home tab
    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "Home")]
    Click Element    xpath=//button[contains(@class, "ui-tab") and contains(text(), "Home")]

 Navigate to the Insert tab
    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "Insert")]
    Click Element    xpath=//button[contains(@class, "ui-tab") and contains(text(), "Insert")]

 Navigate to the Layout tab
    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "Layout")]
    Click Element    xpath=//button[contains(@class, "ui-tab") and contains(text(), "Layout")]

 Navigate to the References tab
    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "References")]
    Click Element    xpath=//button[contains(@class, "ui-tab") and contains(text(), "References")]

Navigate to the Review tab
    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "Review")]
    Click Element    xpath=//button[contains(@class, "ui-tab") and contains(text(), "Review")]

 Navigate to the Format tab
    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "Format")]
    Click Element    xpath=//button[contains(@class, "ui-tab") and contains(text(), "Format")]

 Navigate to the Form tab
    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "Form")]
    Click Element    xpath=//button[contains(@class, "ui-tab") and contains(text(), "Form")]

 Navigate to the AOP tab
    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "AOP")]
    Click Element    xpath=//button[contains(@class, "ui-tab") and contains(text(), "AOP")]

 Navigate to the View tab
    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "View")]
    Click Element    xpath=//button[contains(@class, "ui-tab") and contains(text(), "View")]

 Navigate to the Help tab
    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "Help")]
    Click Element    xpath=//button[contains(@class, "ui-tab") and contains(text(), "Help")]

 Close the sidebar
    Wait Until Element Is Visible    xpath=//div[@title="Sidebar"]
    Click Element   xpath=//div[@title="Sidebar"]

 Open the Navigator
    Wait Until Element Is Visible    xpath=//div[@title="Navigator"]
    Click Element   xpath=//div[@title="Navigator"]

 Close the document
    Wait Until Element Is Visible    css=div.closebuttonimage
    Click Element   css=div.closebuttonimage
    Unselect Frame
    Sleep    2
    Click Element    xpath = //*[@class = "uc-aoe-newFile-a-docx"]

    Select Frame  ${iframe_locator}
   
test home navigation
      
    Wait Until Element Is Visible    xpath://button[contains(@class, "ui-tab") and contains(text(), "Home")]
    Sleep    2
    # Click on the undo button
    Click Element    xpath=//div[contains(@class, 'unospan-home-undo') and @title='Undo']//button

    # Click on the redo button
    Click Element    xpath=//div[contains(@class, 'unospan-home-redo') and @title='Redo']//button
    # Click on the paste button
    Click Element    xpath=//div[contains(@class, 'unotoolbutton') and contains(@class, 'unospan-home-paste')]//button[@alt='Paste']
    
    Click Element    xpath=//div[contains(@class, 'unospan-home-cut')]//button[@alt='Cut']
    Click Element    xpath=//div[contains(@class, 'unospan-home-copy')]//button[@alt='Copy']

    Click Element    xpath=//div[contains(@class, 'unospan-home-brush')]//button[@alt='Clone Formatting']

    Click Element    xpath=//div[contains(@class, 'unospan-home-reset-attributes')]//button[@alt='Clear Direct Formatting']

    Wait Until Element Is Visible    css=#fontnamecombobox > .ui-combobox-button    timeout=5s
    Click Element     css=#fontnamecombobox > .ui-combobox-button
    
    Wait Until Element Is Visible    xpath=//*[@id="fontnamecombobox-entry-4"]    timeout=5s
    Click Element    xpath=//*[@id="fontnamecombobox-entry-4"]    

    Wait Until Element Is Visible    xpath = //*[@id="fontsizecombobox"]/div    timeout=5s
    Click Element    xpath = //*[@id="fontsizecombobox"]/div
    
    Wait Until Element Is Visible    xpath=//*[@id="fontsizecombobox-entry-10"]    timeout=5s
    Click Element    xpath=//*[@id="fontsizecombobox-entry-10"]

    Wait Until Element Is Visible    xpath=//div[contains(@class, "unotoolbutton") and contains(@class, "unospan-home-grow")]/button
    Click Element    xpath=//div[contains(@class, "unotoolbutton") and contains(@class, "unospan-home-grow")]/button
    Wait Until Element Is Visible    xpath=//div[contains(@class, "unotoolbutton") and contains(@class, "unospan-home-shrink")]/button
    Click Element    xpath=//div[contains(@class, "unotoolbutton") and contains(@class, "unospan-home-shrink")]/button
    # Click on the bold button
    Click Element    xpath=//div[contains(@class, 'unospan-home-bold')]
    # Click on the italic button
    Click Element    xpath=//div[contains(@class, 'unospan-home-italic')]
     
    # Click on the underline button
    Click Element    xpath=//div[contains(@class, 'unospan-home-underline')]
        
    # Click on the strikethrough button
    Click Element    xpath=//div[contains(@class, 'unospan-home-strikeout')]
    
    # Click on the subscript button
    Click Element    xpath=//div[contains(@class, 'unospan-home-subscript')]
        # Click on the superscript button
    Click Element    xpath=//div[contains(@class, 'unospan-home-superscript')]
    # Click on the character spacing button
    Click Element    xpath=//div[contains(@class, 'unospan-home-spacing')]
    # Click on the character highlight color button
    Click Element    //div[@title="Character Highlighting Color"]//div[@class="arrowbackground"]
    Click Element    //tr//td//div[@name="01FD55"] 

    # Click on the font color button
    Click Element    //div[@title="Font Color"]//div[@class="arrowbackground"]
    Click Element    //tr//td//div[@name="01FD55"] 

    Click Element    xpath=//div[contains(@class, 'unospan-home-default-bullet')]
    # Click Ordered List button
    Click Element    xpath=//div[contains(@class, 'unospan-home-default-numbering')]
    # Click Increase Indent button
    Click Element    xpath=//div[contains(@class, 'unospan-home-increment-indent')]
    # Click Decrease Indent button
    Click Element    xpath=//div[contains(@class, 'unospan-home-decrement-indent')]
    # Click Formatting Marks button
    Click Element    xpath=//div[contains(@class, 'unospan-home-control-codes')]
    # Click Left-To-Right button
    Click Element    xpath=//div[contains(@class, 'unospan-home-para-left-to-right')]
    # Click Right-To-Left button
    Click Element    xpath=//div[contains(@class, 'unospan-home-para-right-to-left')]
    # Click Left Alignment button
    Click Element    xpath=//div[contains(@class, 'unospan-home-left-para')]
    # Click Center Alignment button
    Click Element    xpath=//div[contains(@class, 'unospan-home-center-para')]
    # Click Right Alignment button
    Click Element    xpath=//div[contains(@class, 'unospan-home-right-para')]
    # Click Justify Alignment button
    Click Element    xpath=//div[contains(@class, 'unospan-home-justify-para')]
    # Click Line Spacing button
    Click Element    xpath=//div[contains(@class, 'unospan-home-line-spacing')]
    # Click Background Color button
    Click Element    //div[@title="Background Color"]//div[@class="arrowbackground"]

    Click Element    //tr//td//div[@name="01FD55"] 

    Click Element    css = #stylesview > div.notebookbar.ui-iconview-entry.selected > div > img

    Click Element     css = #stylesview > div:nth-child(2) > div > img
    Click Element    css = #stylesview > div:nth-child(3) > div > img
    Click Element    css = #stylesview > div:nth-child(4) > div > img
      Click Element    css = #stylesview > div:nth-child(5) > div > img
      Click Element    css = #stylesview > div:nth-child(6) > div >img
      Click Element    css = #stylesview > div:nth-child(7) > div >img
      Click Element    css = #stylesview > div:nth-child(8) > div >img
      Click Element    css = #stylesview > div:nth-child(9) > div >img
      Click Element    css = #stylesview > div:nth-child(10) > div>img

    Click Element    css = #home-insert-table-button
    Click Element    css = #home-search

    Sleep    4
    Click Element    css = #home-insert-page-break-button

    Click Element    css = #CharmapControl-button
    Sleep    1
    Click Element    css = #\32  > form > div.ui-dialog-titlebar.ui-corner-all.ui-widget-header.ui-helper-clearfix > button
    
    Click Element    css = #home-insert-annotation-button
    Click Element    css = #home-insert-annotation-button
    
    Click Element    css = #home-search-dialog-button
    Click Element    css = #home-search-dialog-button

    
    Sleep    100
