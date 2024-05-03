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
    Capture Page Screenshot  1_LoginTest.png


Open Navigation on Home Page
    [Documentation]    Opens the navigation on the home page
    # Wait for the button to be present
    Wait Until Element Is Visible    xpath=//button[@title="Main Navigation"]

    # Click the button
    Click Element    xpath=//button[@title="Main Navigation"]

    Capture Page Screenshot  2_OpenedNavigation.png

    Wait Until Page Contains    Home

Click on Customers link on Home Page
    [Documentation]    Clicks on the Customers link in the navigation on the home page
    # Click on the customer link/button using JavaScript
    Execute JavaScript    document.querySelector('a[href*="customers"]').click()

    Capture Page Screenshot  3_CustomerPage.png

Open create customer page
    [Documentation]    Opens the create customer page
    # Wait for the button to be present
    Wait Until Element Is Visible    xpath=//button[@class="t-Button t-Button--hot js-ignoreChange"]

    # Click the button
    Click Element    xpath=//button[@class="t-Button t-Button--hot js-ignoreChange"]
    
    # Wait for the input text to be fully present
    Sleep    1

    Capture Page Screenshot  4_AddCustomerPage.png

Create new customer
    [Documentation]    Fills in the form to create a new customer

    # Wait until the iframe is visible
    Wait Until Element Is Visible    //iframe[@title="Customer"]    timeout=1s

    # Switch to the iframe
    Select Frame    //iframe[@title="Customer"]

    # Fill in the form
    Input Text    //input[@name="P6_FULL_NAME"]    ${FullNameCustomerPage}
    Input Text    //input[@name="P6_EMAIL_ADDRESS"]    ${EmailCustomerPage}

    Capture Page Screenshot  5_FilledInForm.png

    # Press the Create button inside the iframe
    Click Button    //button[@class="t-Button t-Button--hot "]

    # Switch back to the default content
    Unselect Frame

    # Wait 2 seconds for the page to load
    Sleep    1
    
    Capture Page Screenshot  6_AfterCreateButtonPressed.png

Search for the created customer
    [Documentation]    Searches for the created customer
    Input Text    //input[@class="a-IRR-search-field"]    ${FullNameCustomerPage}

    Sleep    1

    Capture Page Screenshot  7_SearchForCustomer.png

    Click Button    //button[@class="a-Button a-IRR-button a-IRR-button--search"]

    Sleep    1

    Capture Page Screenshot  8_SearchResults.png

Klick edit button next to searched customer
    [Documentation]    Clicks the edit button next to the searched customer to open the edit page

    # Click the edit button
    Click Element    xpath=//a[contains(@href, 'u002Fcustomer?')]

    Sleep    1

    Capture Page Screenshot  9_EditCustomerPage.png

Klick the delete button
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

# Open Navigation Menu
#     [Documentation]    Opens the navigation
#     # Wait for the button to be present
#     Wait Until Element Is Visible    xpath=//button[@title="Main Navigation"]

#     # Click the button
#     Click Element    xpath=//button[@title="Main Navigation"]

#     Capture Page Screenshot  12_OpenedNavigation.png

#     Wait Until Page Contains    Home

# Click on Orders link in Navigation Menu
#     [Documentation]    Clicks on the Orders link in the navigation on the home page
#     # Click on the customer link/button using JavaScript
#     #Execute JavaScript    document.querySelector('a[href*="orders"]').click()
#     Click Element    xpath=//a[contains(@href, 'orders?')]

#     Sleep    3

#     Capture Page Screenshot  13_CustomerPage.png

# Click Add Row button
#     [Documentation]    Clicks the Add Row button to add a new row to the orders table
#     Click Button    //button[@class="a-Button a-Toolbar-item"]

#     Sleep    1

#     Capture Page Screenshot  14_AddRowButtonPressed.png

# Fill in the new row
#     [Documentation]    Fills in the new row in the orders table
    
#     # Fill in the form
#     Click Button    //button[@class="a-Button a-DatePicker--today"]
#     # Input Text    //input[@aria-labelledby="R5488778404799952_ig_grid_vc_ctx R5488778404799952_ig_grid_vc_cur"]    ${OrderCustomer}
#     # Input Text    //input[@id="R5488778404799952_ig_grid_vc_cur"]    ${OrderStatus}
#     # Input Text    //input[@id="R5488778404799952_ig_grid_vc_cur"]    ${OrderStore}

#     Capture Page Screenshot  15_FilledInForm.png