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
    Click Element    xpath=//a[contains(@href, 'orders1?')]

Click Create button on Orders1 page
    [Documentation]    Clicks on the Create button on the Orders1 page

    # Wait for the button to be present
    Wait Until Element Is Visible    xpath=//button[@class="t-Button t-Button--hot js-ignoreChange"]

    # Click the button
    Click Element    xpath=//button[@class="t-Button t-Button--hot js-ignoreChange"]

    Sleep    1

Form on ORDERS: Order Datetime

    Click Element    //input[@class="apex-item-text apex-item-datepicker"]
    
    # Click the today button
    Click Button    //button[@class="a-Button a-DatePicker--today"]
    
    Sleep    1

Form on ORDERS: Customer Id
    
    Click Element    //select[@name="P21_CUSTOMER_ID"]

    # Select the customer from the drop down menu
    Select From List By Label    //select[@name="P21_CUSTOMER_ID"]    ${OrderCustomer}

    Sleep    1

Form on ORDERS: Order Status
    
    Click Element    //input[@name="P21_ORDER_STATUS"]

    Input Text    //input[@name="P21_ORDER_STATUS"]    ${OrderStatus}

Form on ORDERS: Store Id

    Click Element    //select[@name="P21_STORE_ID"]

    Select From List By Label    P21_STORE_ID    ${OrderStore}

    Click Element    //input[@name="P21_ORDER_STATUS"]

Click the Create button after filling in the form
    [Documentation]    Clicks the Create button after filling in the form

    # Click the Create button
    Click Button    //button[@class="t-Button t-Button--hot "]

Search the new made order
    [Documentation]    Search for the new made order

    # Wait for the search bar to be present
    Wait Until Element Is Visible    xpath=//input[@class="a-IRR-search-field"]

    sleep    1

    # Fill in the search bar
    Input Text    xpath=//input[@class="a-IRR-search-field"]    ${OrderCustomer}

    Sleep    1

    # Click the search button
    Click Button    xpath=//button[@class="a-Button a-IRR-button a-IRR-button--search"]

Click edit button next to searched order
    [Documentation]    Clicks the edit button next to the searched customer to open the edit page

    Wait Until Element Is Visible    xpath=//a[contains(@href, 'order-item?')]

    Sleep    2

    # Click the edit button
    Click Element    xpath=//a[contains(@href, 'order-item?')]

Click Delete button
    [Documentation]    Clicks the delete button to delete the order

    Wait Until Element Is Visible    //button[@class="t-Button "]

    Click Button    //button[@class="t-Button "]

    Wait Until Element Is Visible    //button[@class="js-confirmBtn ui-button ui-corner-all ui-widget ui-button--danger"]

    Sleep    1

    Click Button    //button[@class="js-confirmBtn ui-button ui-corner-all ui-widget ui-button--danger"]
    #Click Button    //button[contains(@class, "js-confirmBtn") and contains(text(), "Delete")]
    #Click button    //*[@id="t_PageBody"]/div[14]/div[3]/div/button[2]
    #Execute Javascript    document.querySelector('button.js-confirmBtn').click()
    #Click Element    //button[@class="js-confirmBtn ui-button ui-corner-all ui-widget ui-button--danger"]

    #<button type="button" class="js-confirmBtn ui-button ui-corner-all ui-widget ui-button--danger">Delete</button>

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