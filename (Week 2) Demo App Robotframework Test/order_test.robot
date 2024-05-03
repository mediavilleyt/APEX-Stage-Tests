*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}                 Chrome
${URLLoginPage}            https://apex.vvanhecke.be/ords/r/studenten/demonstration-customer-orders/login?session=7351106761140
${URLHomePage}             https://apex.vvanhecke.be/ords/r/studenten/demonstration-customer-orders/home?session=13847312346739

${USERNAME}                JARNO
${PASSWORD}                demo2024

${PATH}                    C:\UCLL\Apex R&D\Testing Framework\Apex-Testing\results

${FullNameCustomerPage}    Jan Jansen
${EmailCustomerPage}       jan.jansen@jansenmail.com

${OrderDate}               04/25/2024
${OrderCustomer}           Jan Jansen
${OrderStatus}             OPEN
${OrderStore}              Online

*** Keywords ***   
Screenshot

  [Arguments]  ${filename}

  Set Screenshot Directory  ${PATH}

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

Open Navigation on Home Page
    [Documentation]    Opens the navigation on the home page

    # Wait for the button to be present
    Wait Until Element Is Visible    xpath=//button[@title="Main Navigation"]

    # Click the button
    Click Element    xpath=//button[@title="Main Navigation"]

    Wait Until Page Contains    Home

Click on Customers link on Home Page
    [Documentation]    Clicks on the Customers link in the navigation on the home page

    # Click on the customer link/button using JavaScript
    Execute JavaScript    document.querySelector('a[href*="customers"]').click()

Open customer page
    [Documentation]    Opens the create customer page

    # Wait for the button to be present
    Wait Until Element Is Visible    xpath=//button[@class="t-Button t-Button--hot js-ignoreChange"]

    # Click the button
    Click Element    xpath=//button[@class="t-Button t-Button--hot js-ignoreChange"]

Create new customer
    [Documentation]    Fills in the form to create a new customer

    # Wait until the iframe is visible
    Wait Until Element Is Visible    //iframe[@title="Customer"]    timeout=1s

    # Switch to the iframe
    Select Frame    //iframe[@title="Customer"]

    # Fill in the form
    Input Text    //input[@name="P6_FULL_NAME"]    ${FullNameCustomerPage}
    Input Text    //input[@name="P6_EMAIL_ADDRESS"]    ${EmailCustomerPage}

    # Press the Create button inside the iframe
    Click Button    //button[@class="t-Button t-Button--hot "]

    # Switch back to the default content
    Unselect Frame

Open Navigation Menu
    [Documentation]    Opens the navigation

    # Wait for the button to be present
    Wait Until Element Is Visible    xpath=//button[@title="Main Navigation"]

    Sleep    1

    # Click the button
    Click Element    xpath=//button[@title="Main Navigation"]

    Wait Until Page Contains    Home

Click on Orders link in Navigation Menu
    [Documentation]    Clicks on the Orders link in the navigation on the home page

    # Click on the orders link/button using JavaScript
    Click Element    xpath=//a[contains(@href, 'orders?')]

Click Add Row button
    [Documentation]    Clicks the Add Row button to add a new row to the orders table
    Click Button    //button[@data-action="selection-add-row"]

    #Sleep    1

Row: Order Datetime
    [Documentation]    Fills in the new row in the orders table

    # Click the today button
    Click Button    //button[@class="a-Button a-DatePicker--today"]

Row: Customer
    [Documentation]    Fills in the new row in the Customer column of the orders table
    # 1 Click the input field
    Click Element    //*[@id="R5488778404799952_ig_grid_vc"]/div[4]/div[3]/table/tbody/tr[2]/td[3]

    # sleep is needed because the input field is not always visible
    Wait Until Element Is Visible    //*[@id="C5493590567799966"]
    
    # 2 Click the input field inside the input field
    Click Element    //*[@id="C5493590567799966"]

    # sleep is needed because the input field is not always visible
    Wait Until Element Is Visible    //input[@type='text' and @aria-label='Search' and @class='a-PopupLOV-search apex-item-text' and @value='']
    
    # fill in the Customer name
    Input Text    //input[@type='text' and @aria-label='Search' and @class='a-PopupLOV-search apex-item-text' and @value='']    ${OrderCustomer}
    
    Wait Until Element Is Visible    //li[.//span[contains(@class, 'popup-lov-highlight')]]

    # Click the customer we Created from the list
    Click Element    //li[.//span[contains(@class, 'popup-lov-highlight')]]

Row: Order Status
    [Documentation]    Fills in the new row in the Order Status column of the orders table

    # Put in the status of the order in the 4th column
    Click Element    //tr[contains(@data-id, 't1000')]/td[4]

    Wait Until Element Is Visible    //input[@name="5494595998799966" and @maxlength="10"]

    Input Text    //input[@name="5494595998799966" and @maxlength="10"]    ${OrderStatus}

Row: Store
    [Documentation]    Fills in the new row in the store column of the orders table

    Sleep    1
    
    # Put in the location of the store in the 5th column
    Click Element    //tr[contains(@data-id, 't1000')]/td[5]
    
    # It needs to click the element again to show the drop down menu
    Click Element    //tr[contains(@data-id, 't1000')]/td[5]

    # sleep is needed (f*cked if list takes longer than 1 second to load)
    Sleep    1

    # Select the store from the drop down menu
    # 5495578416799967 = The @name of the drop down menu
    # Online = Option to select inside the drop down menu
    Select From List By Label    5495578416799967    ${OrderStore}

    # Click on something else just so that the drop down menu closes and the changes save
    Click Element    //tr[contains(@data-id, 't1000')]/td[4]

    Sleep    1

Click Save button
    [Documentation]    Clicks the Save button to save the new row in the orders table

    # Click the save button
    Click Button    //button[@class="t-Button t-Button--hot "]

    Sleep    1

Search new made row
    [Documentation]    Search for the new made row in the orders table

    Input Text    //input[@class="a-Toolbar-input a-Toolbar-inputText a-Toolbar-item"]    ${OrderCustomer}

    Sleep    1

    Click Button    //button[@class="a-Button a-Toolbar-item"]

    # Wait for the new row to be visible
    Wait Until Page Contains    ${OrderCustomer}

Delete new made row
    [Documentation]    Delete the new made row in the orders table

    Sleep    1
    Click Button    //button[@class="a-Button a-Button--noLabel a-Button--iconTextButton a-Button--actions"]

    Sleep    1

    Click Button    //button[text()='Delete Row']

    Sleep    1

Click Save button
    [Documentation]    Clicks the Save button to save the new row in the orders table
    Click Button    //button[@class="t-Button t-Button--hot "]

    # Give time to save changes
    Sleep    3

Open Navigation Menu
    [Documentation]    Opens the navigation

    # Wait for the button to be present
    Wait Until Element Is Visible    xpath=//button[@title="Main Navigation"]

    # Click the button
    Click Element    xpath=//button[@title="Main Navigation"]

    Wait Until Page Contains    Home

Open customer page
    [Documentation]    Opens the create customer page

    # Wait for the button to be present
    Wait Until Element Is Visible    xpath=//a[contains(@href, 'customers?')]

    # Click the button
    Click Element    xpath=//a[contains(@href, 'customers?')]

Search for the created customer
    [Documentation]    Searches for the created customer
    Input Text    //input[@class="a-IRR-search-field"]    ${FullNameCustomerPage}

    Sleep    1

    Click Button    //button[@class="a-Button a-IRR-button a-IRR-button--search"]

    Sleep    1

Click edit button next to searched customer
    [Documentation]    Clicks the edit button next to the searched customer to open the edit page

    Wait Until Element Is Visible    xpath=//a[contains(@href, 'u002Fcustomer?')]

    # Click the edit button
    Click Element    xpath=//a[contains(@href, 'u002Fcustomer?')]

    Sleep    1

Click the delete button
    [Documentation]    Clicks the delete button to delete the customer on the edit page

    # Switch to the iframe
    Select Frame    //iframe[@title="Customer"]

    # Click the delete button
    Click Button    //button[@class="t-Button t-Button--danger t-Button--simple"]

    Sleep    1

    Unselect Frame
    # Click the confirm deletion action
    Click Button    //button[@class="js-confirmBtn ui-button ui-corner-all ui-widget ui-button--danger"]

    # Give time to delete the customer
    Sleep    1

    Close browser