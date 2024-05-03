# APEX Stage Tests
 
## Week 1
>[!Note]
>Deze folder bevat alle tests die nog niet aangemaakt waren voor Apex Office Print

1. DOCX
   - Attach
   - Coluimn Break
   - D3
   - Embed
   - From
   - Internal Link
   - Table

2. PPTX
   - Auto Link
   - Dynamic Text Styling
   - hide slide
   - Hyperlink
   - Image Tag
   - Insert Document
   - Link Slide With Link
   - Link Slide Without Link
   - Slide Repeat
   - Table Row Span

3. XLSX
   - Auto Link
   - D3 Images
   - Formula
   - Insert Document
   - Sheet Generation
   - Span
   - Static Condition
   - Text Box

## Week 2
### Documentation Selenium Code 
>Scripts.py

| Code | Description | Parameters | Returns |
| ------------- | ------------- | ------------- | ------------- |
| <br><pre lang="python">start_browser(URL)</pre>   | Starts the browser and connects to a specified URL. | [URL]: Desired URL | None |
| <br><pre lang="python">login(username, password)</pre> | Logs into the website using provided username and password. | [username]: Username for login. [password]: Password for login.  | None |
| <br><pre lang="python">home()</pre> | Navigates to the home page of the website. | None | None |
| <br><pre lang="python">create_product(name, price, availability, imageUrl, docUrl)</pre> | Creates a new product with given details. | [name]: Name of the product. [price]: Price of the product. [availability]: Availability status of the product. [imageUrl]: URL of the product image. [docUrl]: URL of the product documentation. | None |
| <br><pre lang="python">delete_product(name)</pre> | Deletes a product by its name. | [name]: Name of the product to delete. | None |
| <br><pre lang="python">create_customer(name, email)</pre> | Creates a new customer with provided name and email. | [name]: Name of the customer. [email]: Email address of the customer. | None |
| <br><pre lang="python">delete_customer(name)</pre> | Deletes a customer by name. | [name]: Name of the customer to delete. | None |
| <br><pre lang="python">create_order(name, status, store, id, product_name, price, quantity)</pre> | Creates a new order with provided details. | [name]: Name of the order. [status]: Status of the order. [store]: Store for the order. [id]: ID of the order. [product_name]: Name of the product in the order. [price]: Price of the product in the order. [quantity]: Quantity of the product in the order. | None |
| <br><pre lang="python">delete_order(name)</pre> | Deletes an order by name. | [name]: Name of the order to delete. | None |
| <br><pre lang="python">create_store(name, email, address, latitude, longitude, docUrl)</pre> | Creates a new store with provided details. | [name]: Name of the store. [email]: Email address of the store. [address]: Address of the store. [latitude]: Latitude of the store location. [longitude]: Longitude of the store location. [docUrl]: URL of the store documentation. | None |
| <br><pre lang="python">delete_store(name)</pre> | Deletes a store by name. | [name]: Name of the store to delete. | None |
| <br><pre lang="python">create_other_order(name, status, store)</pre> | Creates another order with provided details. | [name]: Name of the order. [status]: Status of the order. [store]: Store for the order. | None |
| <br><pre lang="python">edit_other_order(name, product_id, price, quantity)</pre> | Edits another order with provided details. | [name]: Name of the order. [product_id]: ID of the product in the order. [price]: Price of the product in the order. [quantity]: Quantity of the product in the order. | None |
| <br><pre lang="python">delete_other_order(name)</pre> | Deletes another order by name. | [name]: Name of the order to delete. | None |
| <br><pre lang="python">switch_to_iframe(title)</pre> | Switches to an iframe by its title attribute. | [title]: Title of the iframe. | None |
| <br><pre lang="python">switch_to_default_content()</pre> | Switches back to default content from an iframe. | None | None |
| <br><pre lang="python">end_test()</pre> | Ends the test session and closes the browser. | None | None |

### Documentation RobotFramework Code
>Admin.robot

| Test Cases                               | Description                                                                                           |
|------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Open login page                          | Opens the browser to the login page of the web application.                                            |
| Input name and password                  | Inputs the username and password on the login page.                                                    |
| Click login                              | Clicks the login button on the login page.                                                             |
| Open Navigation on Home Page             | Opens the navigation menu on the home page.                                                            |
| Click on admin link                      | Opens the admin tab from the navigation menu.                                                          |
| Go to product page                       | Navigates to the products page within the admin section.                                               |
| Click button create                      | Opens the create product dialog on the products page.                                                   |
| Click the delete button                  | Deletes a customer on the edit page.                                                                   |

| Keywords                                 | Description                                                                                           |
|------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Screenshot                               | Captures a screenshot of the current page.                                                             |
| Open Browser                             | Opens the browser and navigates to the specified URL.                                                  |
| Input Text                               | Inputs text into a specified field.                                                                    |
| Click Button                             | Clicks on a specified button.                                                                         |
| Wait Until Element Is Visible            | Waits until the specified element is visible.                                                          |
| Capture Page Screenshot                  | Captures a screenshot of the current page.                                                             |
| Execute JavaScript                       | Executes JavaScript code.                                                                             |
| Select Frame                             | Switches to the specified iframe.                                                                     |
| Unselect Frame                           | Switches back to the default content from an iframe.                                                   |
| Sleep                                    | Pauses the test execution for a specified duration.                                                    |

<hr>

> order_test.robot

| Test Cases                               | Description                                                                                           |
|------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Open login page                          | Opens the browser to the login page of the web application.                                            |
| Input name and password                  | Inputs the username and password on the login page.                                                    |
| Click login                              | Clicks the login button on the login page.                                                             |
| Open Navigation on Home Page             | Opens the navigation menu on the home page.                                                            |
| Click on Customers link on Home Page     | Clicks on the Customers link in the navigation on the home page.                                        |
| Open customer page                       | Opens the create customer page.                                                                        |
| Create new customer                      | Fills in the form to create a new customer.                                                            |
| Open Navigation Menu                     | Opens the navigation.                                                                                  |
| Click on Orders link in Navigation Menu  | Clicks on the Orders link in the navigation on the home page.                                           |
| Click Add Row button                     | Clicks the Add Row button to add a new row to the orders table.                                         |
| Row: Order Datetime                      | Fills in the new row in the orders table with order datetime.                                           |
| Row: Customer                            | Fills in the new row in the Customer column of the orders table.                                        |
| Row: Order Status                        | Fills in the new row in the Order Status column of the orders table.                                    |
| Row: Store                               | Fills in the new row in the store column of the orders table.                                           |
| Click Save button                        | Clicks the Save button to save the new row in the orders table.                                         |
| Search new made row                      | Search for the new made row in the orders table.                                                        |
| Delete new made row                      | Deletes the new made row in the orders table.                                                           |
| Click Save button                        | Clicks the Save button to save the new row in the orders table.                                         |
| Open Navigation Menu                     | Opens the navigation.                                                                                  |
| Open customer page                       | Opens the create customer page.                                                                        |
| Search for the created customer          | Searches for the created customer.                                                                      |
| Click edit button next to searched customer | Clicks the edit button next to the searched customer to open the edit page.                           |
| Click the delete button                  | Clicks the delete button to delete the customer on the edit page.                                       |
| Close browser                            | Closes the browser.                                                                                    |

| Keywords                                 | Description                                                                                           |
|------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Screenshot                               | Captures a screenshot of the current page.                                                             |
| Open Browser                             | Opens the browser and navigates to the specified URL.                                                  |
| Input Text                               | Inputs text into a specified field.                                                                    |
| Click Button                             | Clicks on a specified button.                                                                         |
| Wait Until Element Is Visible            | Waits until the specified element is visible.                                                          |
| Execute JavaScript                       | Executes JavaScript code.                                                                             |
| Select Frame                             | Switches to the specified iframe.                                                                     |
| Unselect Frame                           | Switches back to the default content from an iframe.                                                   |
| Sleep                                    | Pauses the test execution for a specified duration.                                                    |

<hr>

> order1.robot

| Test Cases                               | Description                                                                                           |
|------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Open login page                          | Opens the browser to the login page of the web application.                                            |
| Input name and password                  | Inputs the username and password on the login page.                                                    |
| Click login                              | Clicks the login button on the login page and waits for the home page to load.                         |
| Open Navigation on Home Page             | Opens the navigation menu on the home page.                                                            |
| Click on Customers link on Home Page     | Clicks on the Customers link in the navigation on the home page.                                        |
| Open customer page                       | Opens the create customer page.                                                                        |
| Create new customer                      | Fills in the form to create a new customer.                                                            |
| Open Navigation Menu                     | Opens the navigation.                                                                                  |
| Click on Orders link in Navigation Menu  | Clicks on the Orders link in the navigation on the home page.                                           |
| Click Create button on Orders1 page      | Clicks on the Create button on the Orders1 page.                                                       |
| Form on ORDERS: Order Datetime           | Fills in the form with order datetime.                                                                 |
| Form on ORDERS: Customer Id              | Selects the customer from the dropdown menu.                                                           |
| Form on ORDERS: Order Status             | Fills in the form with order status.                                                                   |
| Form on ORDERS: Store Id                 | Selects the store from the dropdown menu.                                                              |
| Click the Create button after filling in the form | Clicks the Create button after filling in the form.                                             |
| Search the new made order                | Searches for the new made order.                                                                        |
| Click edit button next to searched order | Clicks the edit button next to the searched order to open the edit page.                               |
| Click Delete button                      | Clicks the delete button to delete the order.                                                          |
| Open Navigation Menu                     | Opens the navigation.                                                                                  |
| Open customer page                       | Opens the create customer page.                                                                        |
| Search for the created customer          | Searches for the created customer.                                                                      |
| Click edit button next to searched customer | Clicks the edit button next to the searched customer to open the edit page.                           |
| Click the delete button                  | Clicks the delete button to delete the customer on the edit page.                                       |

| Keywords                                 | Description                                                                                           |
|------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Screenshot                               | Captures a screenshot of the current page.                                                             |
| Open Browser                             | Opens the browser and navigates to the specified URL.                                                  |
| Input Text                               | Inputs text into a specified field.                                                                    |
| Input Password                           | Inputs password into a specified field.                                                                |
| Click Button                             | Clicks on a specified button.                                                                         |
| Wait Until Page Contains                 | Waits until the specified text appears on the page.                                                    |
| Wait Until Element Is Visible            | Waits until the specified element is visible.                                                          |
| Execute JavaScript                       | Executes JavaScript code.                                                                             |
| Select Frame                             | Switches to the specified iframe.                                                                     |
| Unselect Frame                           | Switches back to the default content from an iframe.                                                   |
| Sleep                                    | Pauses the test execution for a specified duration.                                                    |
| Select From List By Label                | Selects an option from a dropdown menu by its label.                                                   |

## Week 3 
>[!Note]
>Deze folder bevat tests voor APEX Office Edit

> [!IMPORTANT]  
> Deze tests zijn niet compleet

