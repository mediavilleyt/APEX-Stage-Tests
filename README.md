# APEX Stage Tests
 
## Week 1
>[!Note]
> This folder contains all tests that have not yet been created for Apex Office Print

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

[Robot Framework Documentation](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)

| File name | Description |
|-----------|-------------|
| admin.robot | Tries to add products to the website as an admin |
| order_test.robot | Tries to add a customer, gives him an order, then deletes everything |
| order1.robot | Does the same as order_test.robot but for a different order page |

## Week 3 
>[!Note]
> This folder contains tests for APEX Office Edit

> [!IMPORTANT]  
> These tests are incomplete

### Apex Office Edit Testing

Welcome to the testing repository for [APEX Office Edit](https://apex.vvanhecke.be/ords/f?p=131:100:9521489571363).

This repository contains Robot Framework tests written in Python for ensuring the functionality and reliability of the website.

#### Prerequisites
Before running the tests, ensure you have the following installed:

* Python
* To check if u have python installed run `python --version`
* Robot Framework
* Getting Started

#### To execute the tests, follow these steps:
* Clone this repository to your local machine.
`git clone https://github.com/mediavilleyt/AOE-RobotFramework`
* Open command prompt or in Visual Studo Code open the terminal
* Navigate to the directory where the repository is cloned. ```CD: your/path/here```
* Run the following command to execute the tests:
`robot --outputdir results file.robot`

If the above command doesn't work, you can also use `python -m robot -d results file.robot`


## Contributors

* Jonas Devadder
* Keanu Van Acker
* Jarno Hennes
* Marie Remory
