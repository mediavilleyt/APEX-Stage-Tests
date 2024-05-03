*** Settings ***
Library           SeleniumLibrary

*** Variables ***

${URL}                     https://apex.vvanhecke.be/ords/f?p=131:100:9521489571363:::::

${BROWSER}                 edge
${USERNAME}                admin

# These are the xpaths for the iFrames in the PowerPoint application
${iFrame_Main}             //iframe[@name="ucaoe-iframe-ui-id-3"]
${iFrame_Document}           //iframe[@class="resize-detector"]

# This is a variable to find an element that contains a certain text
${Contains}    [contains(text(), "{}")]/..

# These are the navigation buttons in the PowerPoint application
${File_Button}        //button[@class="ui-tab notebookbar" and contains(text(), "File")]
${Home_Button}        //button[@class="ui-tab notebookbar" and contains(text(), "Home")]
${Insert_Button}        //button[@class="ui-tab notebookbar" and contains(text(), "Insert")]
${Layout_Button}        //button[@class="ui-tab notebookbar" and contains(text(), "Layout")]
${Review_Button}        //button[@class="ui-tab notebookbar" and contains(text(), "Review")]
${Format_Button}        //button[@class="ui-tab notebookbar" and contains(text(), "Format")]
${AOP_Button}        //button[@class="ui-tab notebookbar" and contains(text(), "AOP")]
${View_Button}        //button[@class="ui-tab notebookbar" and contains(text(), "View")]
${Help_Button}        //button[@class="ui-tab notebookbar" and contains(text(), "Help")]

# This is the title of the PowerPoint application
${Title}    Testing the PowerPoint application title
${Text}    Testing the PowerPoint application text

# This is a variable to check if a button exists
#${BUTTON_EXISTS}    True

# This is a variable to check if a button exists
${LEFT_ALIGN_BUTTON_SELECTED}    Run Keyword And Return Status    Page Should Contain Element    //button[@class="ui-content unobutton selected" and @alt="Left"]
${CENTER_ALIGN_BUTTON_SELECTED}    Run Keyword And Return Status    Page Should Contain Element    //button[@class="ui-content unobutton selected" and @alt="Center"]
${RIGHT_ALIGN_BUTTON_SELECTED}    Run Keyword And Return Status    Page Should Contain Element    //button[@class="ui-content unobutton selected" and @alt="Right"]
${JUSTIFY_ALIGN_BUTTON_SELECTED}    Run Keyword And Return Status    Page Should Contain Element    //button[@class="ui-content unobutton selected" and @alt="Justify"]



*** Test Cases ***

Login with correct Username and Password
    Open Browser    ${URL}    browser=edge
    Maximize Browser Window

    # Put in the username
    Input Text    xpath: //*[@placeholder='Your name']    ${USERNAME}

    # Click the button with the text "Sign In"
    Click Button    xpath: //*${Contains.format("Sign In")}

    # Wait for 1 second to let the page load
    Sleep    1

Open the PowerPoint application
    Click Link   xpath: //*${Contains.format("Microsoft PowerPoint")}

Click and edit the Title
    # Wait until the "File" button is visible
    Wait Until Page Contains Element    ${iFrame_Main}    15

    # Switch to the iframe
    Select Frame    ${iFrame_Main}

    # Wait until the document iFrame is visible
    Wait Until Page Contains Element    ${iFrame_Document}    15
    
    Sleep    3
    
    # Clicks the "Click to add title" text box
    Click Element    //div[@class="leaflet-container leaflet-retina notebookbar-opened"]

    Click Element    //div[@class="preview-frame preview-frame-landscape"]//img[@alt="preview of page 1"]

    Sleep    1

    Click Element    //div[@class="leaflet-container leaflet-retina notebookbar-opened"]

    #! This is the part that doesn't work, it needs to click on the title and give it text but it isn't able to find the text box
    #?Input text       //*[@id="clipboard-area"]/text()    ${Title}

    # Switch to the iframe inside iframe
    Select Frame    ${iFrame_Document}

    # Wait for 2 seconds to let the page load
    Sleep    2

Test all navigation buttons
    Unselect Frame

    Select Frame   ${iFrame_Main}

    Sleep    1

    # Wait until the "File" button is visible
    Wait Until Element Is Visible    //button${Contains.format("File")}

    # Press all the buttons in the nvigation to test if they work
    Click Button    ${File_Button}
    Click Button    ${Home_Button}
    Click Button    ${Insert_Button}
    Click Button    ${Layout_Button}
    Click Button    ${Review_Button}
    Click Button    ${Format_Button}
    Click Button    ${AOP_Button}
    Click Button    ${View_Button}
    Click Button    ${Help_Button}

    Sleep    1

Test File navigation buttons
    Click Button    ${File_Button}

    # Wait until the "New" button is visible
    #?Wait Until Element Is Visible    //button${Contains.format("New")}

    # Press all the buttons in the "File" navigation to test if they work
    #Click Button    //button${Contains.format("Save")}
    #Click Button    //button${Contains.format("Save As")}
    #Click Button    //button${Contains.format("Export As")}
    #Click Button    //button${Contains.format("Properties")}

    Sleep    1

Test Home navigation buttons
    Click Button    ${Home_Button}

    # Wait until the "Paste" button is visible
    Wait Until Element Is Visible    //button[contains(@class, 'ui-content unobutton') and .//label[contains(text(), 'Paste')]]
    

    # Press all the buttons in the "Home" navigation to test if they work
    #Click Button    //button[contains(@class, 'ui-content unobutton') and .//label[contains(text(), 'Paste')]]
    Click Button    //button[@alt='Bold']
    Click Button    //button[@alt='Italic']
    Click Button    //button[@alt='Underline']
    Click Button    //button[@alt='Strikethrough']
    Click Button    //button[@alt='Shadow']

    # This opens the fonts dropdown menu
    Click Element    css=#fontnamecombobox > .ui-combobox-button

    # Wait for the dropdown menu to appear
    Wait Until Element Is Visible    //div[@id="fontnamecombobox-entries"]

    # Select the option 'Amiri' from the dropdown menu
    #? I don't know a better way then to use the id of the element
    Click Element    //*[@id="fontnamecombobox-entry-1"]

    Sleep    1

    # This opens the text-size dropdown menu
    Click Element    css=#fontsizecombobox > .ui-combobox-button

    Wait Until Element Is Visible    //div[@class='vertical jsdialog']

    # Select the option '72 pt' from the dropdown menu
    Click Element    //*[@id="fontsizecombobox-entry-28"]

    # Click te small arrow next to the Character Highlighting Color to open the color picker
    Click Element    //div[@title="Character Highlighting Color"]//div[@class="arrowbackground"]
    
    # Color Hex: #01FD55 (Green)
    Click Element    //tr//td//div[@name="01FD55"]

    # Click te small arrow next to the Font Color to open the color picker
    Click Element    //div[@title="Font Color"]//div[@class="arrowbackground"]
    
    # Color Hex: #006CE7 (Blue)
    Click Element    //tr//td//div[@name="006CE7"]

    # Click the Increase Size button
    Click Button    //button[@alt="Increase Size"]

    # Click the Decrease Size button
    Click Button    //button[@alt="Decrease Size"]

    # Click the Top button to let the text go to the top of the text box
    Click Button    //button[@class="ui-content unobutton" and @alt="Top"]

    # Click the Middle button to let the text go to the middle of the text box
    Click Button    //button[@class="ui-content unobutton" and @alt="Center"]

    # Click the Bottom button to let the text go to the bottom of the text box
    Click Button    //button[@class="ui-content unobutton" and @alt="Bottom"]

    # Click the Left Align button to let the text go to the left of the text box
    Click Button    //button[@class="ui-content unobutton" and @alt="Left"]

    # Wait for 0.5 seconds to let the text align
    Sleep    0.5

    # Click the Center Align button to let the text go to the center of the text box
    Click Button    //div[@class='unotoolbutton notebookbar ui-content unospan-home-center-paragraph unoCenterPara no-label']//button[@class="ui-content unobutton" and @alt="Center"]
    
    # Wait for 0.5 seconds to let the text align
    Sleep    0.5

    # Click the Right Align button to let the text go to the right of the text box
    Click Button    //button[@class="ui-content unobutton" and @alt="Right"]

    # Wait for 0.5 seconds to let the text align
    Sleep    0.5

    # Click the Justify Align button to let the text go to the right of the text box
    Click Button    //div[@class="unotoolbutton notebookbar ui-content unospan-home-justify-para unoJustifyPara no-label"]//button[@class="ui-content unobutton" and @alt="Justified"]

    # Click the Center Align button again to let the text go to the center of the text box
    Click Button    //div[@class='unotoolbutton notebookbar ui-content unospan-home-center-paragraph unoCenterPara no-label']//button[@class="ui-content unobutton" and @alt="Center"]

    Click Button    //button[@alt='Bold']
    Click Button    //button[@alt='Italic']
    Click Button    //button[@alt='Underline']
    Click Button    //button[@alt='Strikethrough']

    Sleep    1

    Click Button    //button[@alt='Shadow']

    # Click te small arrow next to the Character Highlighting Color to open the color picker
    Click Element    //div[@title="Character Highlighting Color"]//div[@class="arrowbackground"]
    
    # This picks the option (No color)
    Click Element    //tr//td//div[@class="color no-color"]

    # Click te small arrow next to the Font Color to open the color picker
    Click Element    //div[@title="Font Color"]//div[@class="arrowbackground"]
    
    # Color Hex: #000000 (Black)
    Click Element    //tr//td//div[@name="000000"]

    # Click the Unordered List button
    Click Button    //button[@alt="Unordered List"]

    # Click the Ordered List button
    Click Button    //button[@alt="Ordered List"]

    # Click the Ordered List button again to disable the list
    Click Button    //button[@alt="Ordered List"]

Test shapes
    Click button     //div[@class="unotoolbutton notebookbar ui-content unospan-home-basic-shapes unoBasicShapes no-label inline has-dropdown"]//button[@class="ui-content unobutton"]

    Wait Until Element Is Visible    //div[@data-uno="BasicShapes.cube"]

    Click Element    //div[@data-uno="BasicShapes.cube"]

    # Click the Flip Vertical button
    Click Element    //span[@class="ui-content unolabel" and contains(text(), "Flip Vertically")]

    # Click the Flip Horizontal button
    Click Element    //span[@class="ui-content unolabel" and contains(text(), "Flip Horizontally")]

    # Click Line color button
    Click Element    //div[@class="unotoolbutton notebookbar ui-content unospan-draw-xline-color has-dropdown--color"]//div[@class="arrowbackground"]

    # Color Hex: #99050C (Red)
    Click Element    //tr//td//div[@name="99050C"]

    # Click Fill color button
    Click Element    //div[@class="unotoolbutton notebookbar ui-content unospan-draw-fill-color has-dropdown--color"]//div[@class="arrowbackground"]

    # Color Hex: #FFFFFF (White)
    Click Element    //tr//td//div[@name="FFFFFF"]

    Sleep    10

# Test Insert navigation buttons
#     Click Button    ${Insert_Button}

#     Click Button    //button[@alt='New Slide']
#     Click Button    //button[@alt='Delete Slide']
#     Click Button    //button[@alt='Duplicate Slide']
#     Click Button    //button[@alt='Delete Slide']
#     Click Button    //button[@alt='']

#     Sleep    10