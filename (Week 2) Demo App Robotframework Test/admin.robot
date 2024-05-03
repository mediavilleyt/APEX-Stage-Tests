*** Settings ***
Library           SeleniumLibrary

*** Keywords ***   
Screenshot

  [Arguments]  ${filename}

  Set Screenshot Directory  ${PATH}

*** Variables ***
${BROWSER}                 Chrome
${URLLoginPage}            https://apex.vvanhecke.be/ords/r/studenten/demonstration-customer-orders/login?session=7351106761140
${URLHomePage}             https://apex.vvanhecke.be/ords/r/studenten/demonstration-customer-orders/home?session=13847312346739

${USERNAME}                marie
${PASSWORD}                ParIs1995
${PATH}                    C:\Users\Marie local\Desktop\apex R&D\test\Apex-Testing-main\result
${PRODUCTNAME}             testproduct
${UNITPRICE}               10.00
${STATUS}                  available
${PRODUCTDETAILS}          C:\Users\Marie local\Desktop\apex R&D\test\Apex-Testing-main\download
${PRODUCTIMAGE}            C:\Users\Marie local\Desktop\apex R&D\test\Apex-Testing-main\testimage


*** Test Cases ***
Open login page
    [Documentation]    Opens browser to the login page
    Open Browser    ${URLLoginPage}    ${BROWSER}

Input name and password
    [Documentation]    Input the name and password
    Input Text      Name=P9999_USERNAME    ${USERNAME}
    Input Password  Name=P9999_PASSWORD    ${PASSWORD}

Click login
    [Documentation]    Click on the login button and wait for the website to load the home page
    Click Button    //button[@class="t-Button t-Button--hot "]
    Wait Until Page Contains    Demonstration - Customer Orders
    Capture Page Screenshot  1_LoginTest.png


Open Navigation on Home Page
    [Documentation]    Opens the navigation on the home page
    # Wait for the button to be present
    Wait Until Element Is Visible    xpath=//button[@title="Main Navigation"]

    # Click the button
    Click Element    xpath=//button[@title="Main Navigation"]

    Capture Page Screenshot  16_OpenedNavigation.png

    Wait Until Page Contains    Home

click on admin link 
   [Documentation]    open admin tab

    Execute JavaScript    document.querySelector('a[href*="administration"]').click()

       Capture Page Screenshot  17_Openedadmin.png

go to product page
    [Documentation]     opens the products in the admin page
    Click Element    xpath=/html/body/form/div[1]/div[2]/div[2]/main/div[2]/div/div/div[1]/div/div[1]/div[2]/div[2]/ul/li[2]/a/div[2]/h3    

    
    Capture Page Screenshot  19_productsPage.png

click button create
    [Documentation]  opens the create on the dialog page 
    Wait Until Element Is Visible    //*[@id="apex_dialog_1"]/iframe    timeout=1s

    # Switch to the iframe
    Select Frame  locator=//*[@id="apex_dialog_1"]/iframe   
    Click Button    xpath=//button[@class='t-Button t-Button--hot js-ignoreChange' and @id='B5576918809801056']
    

    # add new product

    Select Frame  locator=id="apex_dialog_6"  

    

    Input Text    //*[@id="P14_PRODUCT_NAME"]    ${PRODUCTNAME}
    Input Text    //*[@id="P14_UNIT_PRICE"]    ${UNITPRICE}
    Input Text    //*[@id="P14_STATUS"]    ${STATUS} 
    Input Text    //*[@id="P14_PRODUCT_DETAILS_DROPZONE"]    ${PRODUCTDETAILS}
    Input Text    //*[@id="P14_PRODUCT_IMAGE_DROPZONE"]    ${PRODUCTIMAGE} 
    
    Capture Page Screenshot  20_products.png

    Unselect Frame
    Unselect Frame

 Click the delete button
     [Documentation]    Clicks the delete button to delete the customer on the edit page

     # Switch to the iframe
     Select Frame    //iframe[@title="Customer"]

     # Click the delete button
     Click Button    //button[@class="t-Button t-Button--danger t-Button--simple"]

     Capture Page Screenshot     10_BeforeDeleteButtonPressed.png

     Sleep    1

     Unselect Frame
     # Click the confirm deletion action
     Click Button    //button[@class="js-confirmBtn ui-button ui-corner-all ui-widget ui-button--danger"]

     Sleep    1

     Capture Page Screenshot    11_AfterDeleteButtonPressed.png

