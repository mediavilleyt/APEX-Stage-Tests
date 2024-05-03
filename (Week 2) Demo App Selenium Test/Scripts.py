from Functions import press_text_button,press_class_button, enter_js_text,enter_keys, press_name_button, clear_input,press_css_button, get_element, select_option, upload_file, detect_error, js_href, press_xpath_button, date_picker, browser
from Printer import start_test, print_info, print_result, print_final_result
import time
#-------------------------
# Start browser
#-------------------------

def start_browser(URL):
    start_test("Starting browser...")
    try:
        browser.get(URL)
        print_info("Connected to site", "0")
        browser.maximize_window()
        print_info("Window Maximized", "0")
        print_result(True)
    except:
        print_info("Could not connect to site", "1")
        print_result(False)
        return


#-------------------------
# Login
#-------------------------

def login(username, password):
    start_test("Logging in...")
    enter_keys('text_field', 'class', username)
    enter_keys('password', 'class', password)
    press_class_button('t-Button')
    if(detect_error() == True):
        press_class_button('t-Button--closeAlert')
        print_info("Login failed", "1")
        print_result(False)
        press_class_button('t-Button--closeAlert')
        return
    print_info("Logged in", "0")
    print_result(True)
    time.sleep(1)

#-------------------------
# Home
#-------------------------

def home():
    start_test("Going to home page...")
    element = get_element('t-Header-logo-link', 'class')
    try:
        element.click()
    except Exception as e:
        return
    print_info("Home page", "0")
    print_result(True)
    time.sleep(1)

#-------------------------
# Create and delete functions
#-------------------------

result = False

def create_product(name, price, availability, imageUrl, docUrl):
    start_test("Creating product...")
    press_css_button('.t-Header-controls button')
    press_text_button('Administration')
    press_css_button('.t-Header-controls button')
    js_href("Products")
    switch_to_iframe('Products')
    press_css_button('.a-IRR-buttons button')
    switch_to_default_content()
    switch_to_iframe('Product')
    enter_keys('.container .container .row:nth-child(1) input', 'css', name)
    enter_keys('.container .container .row:nth-child(2) input', 'css', price)
    select_option('.container .container .row select', 'css', availability)
    upload_file('.container .container .row:nth-child(4) input', 'css', docUrl)
    upload_file('.container .container .row:nth-child(5) input', 'css', imageUrl)
    press_css_button('.t-ButtonRegion-wrap .t-ButtonRegion-col:last-child button')
    if detect_error():
        print_info("Fail: there was an error", "2")
        press_class_button('t-Button--closeAlert')    
        press_class_button('t-Button')
        print_info('Product was not created', '1')
        result = False
    else:
        print_info("Product created", "0")
        result = True
    switch_to_default_content()
    press_class_button('ui-dialog-titlebar-close')
    print_result(result)
    home()
    time.sleep(1)

def delete_product(name):
    start_test("Deleting product...")
    press_css_button('.t-Header-controls button')
    press_text_button('Administration')
    press_css_button('.t-Header-controls button')
    js_href("Products")
    switch_to_iframe('Products')
    press_class_button('a-Button--noUI')
    print_info('If above failed there is no active search', '0')
    enter_keys('a-IRR-search-field', 'class', name)
    press_class_button('a-IRR-button--search')
    time.sleep(1)
    press_class_button('fa-edit')
    switch_to_default_content()
    switch_to_iframe('Product') 
    press_xpath_button("//*[contains(text(), 'Delete')]")
    switch_to_default_content()
    press_class_button('js-confirmBtn')
    press_xpath_button('(//*[@title="Close"])')
    print_info("Product deleted", "0")
    print_result(True)
    home()
    time.sleep(1)

def create_customer(name, email):
    start_test("Creating user...")
    press_text_button('Customers')
    press_class_button('t-Button--hot')
    switch_to_iframe('Customer')
    enter_keys('.container .container .row:first-child input', 'css', name)  # For the first child
    enter_keys('.container .container .row:last-child input', 'css', email)  # For the second child
    press_class_button('t-Button--hot')
    if(detect_error() == True):
        press_class_button('t-Button--closeAlert')    
        press_class_button('t-Button')
    switch_to_default_content()
    print_info("User created", "0")
    print_result(True)
    home()
    time.sleep(1)

def delete_customer(name):
    start_test("Deleting user...")
    press_text_button('Customers')
    press_class_button('a-Button--noUI')
    print_info('If above failed there is no active search', '0')
    enter_keys('a-IRR-search-field', 'class', name)
    press_class_button('a-IRR-button--search')
    time.sleep(1)
    press_class_button('fa-edit')
    switch_to_iframe('Customer')
    press_css_button('.t-ButtonRegion-buttons button:last-child')
    switch_to_default_content()
    press_class_button('js-confirmBtn')
    print_info("User deleted", "0")
    print_result(True)
    home()
    time.sleep(1)

def create_order(name, status, store, id, product_name, price, quantity):
    global result
    start_test("Creating order...")
    press_text_button('Orders')
    press_xpath_button('//button[@data-action="selection-add-row"]')
    date_picker()
    press_xpath_button('(//*[@aria-selected="true"])[2]/td[3]')
    press_xpath_button('(//*[@aria-selected="true"])[2]/td[3]')
    enter_keys('//*[@id="PopupLov_4_C5493590567799966_dlg"]/div[1]/input', 'xpath', name)
    press_class_button('a-IconList-item')
    press_xpath_button('(//*[@aria-selected="true"])[2]/td[4]')
    enter_keys('(//*[@aria-selected="true"])[2]/td[4]/div/input', 'xpath',status)
    press_xpath_button('(//*[@aria-selected="true"])[2]/td[5]')
    press_xpath_button('(//*[@aria-selected="true"])[2]/td[5]')
    select_option('(//*[@aria-selected="true"])[2]/td[5]/div/select', 'xpath', store)
    press_xpath_button('(//*[@aria-label="Edit"])[2]')
    press_xpath_button('(//*[@aria-selected="true"])[3]/td[2]')
    clear_input('(//*[@aria-selected="true"])[3]/td[2]/div/input', 'xpath')
    press_xpath_button('(//*[@aria-selected="true"])[3]/td[2]')
    enter_keys('(//*[@aria-selected="true"])[3]/td[2]/div/input', 'xpath', id)
    press_xpath_button('(//*[@aria-selected="true"])[3]/td[3]')
    select_option('(//*[@aria-selected="true"])[3]/td[3]/div/select', 'xpath', product_name)
    press_xpath_button('(//*[@aria-selected="true"])[3]/td[4]')
    enter_keys('(//*[@aria-selected="true"])[3]/td[4]/div/input', 'xpath', price)
    press_xpath_button('(//*[@aria-selected="true"])[3]/td[5]')
    enter_keys('(//*[@aria-selected="true"])[3]/td[5]/div/input', 'xpath', quantity)
    press_xpath_button('(//*[@aria-label="Edit"])[2]')
    press_xpath_button("""(//*[@onclick="apex.submit({request:'SAVE',validate:true});"])""")
    if detect_error():
        print_info("Fail: there was an error", "2")
        press_class_button('t-Button--closeAlert')   
        print_info('Order not created', '1')
        press_xpath_button('(//*[@aria-selected="true"])[2]/td[1]')
        press_xpath_button("//*[contains(text(), 'Delete Row')]")
        press_xpath_button("//*[contains(text(), 'Save')]")
        result = False
    else:
        print_info("Product created", "0")
        result = True
    print_result(True)
    home()
    time.sleep(1)

def delete_order(name):
    start_test("Deleting order...")
    press_text_button('Orders')
    press_class_button('a-Button--noUI')
    print_info('If above failed there is no active search', '0')
    enter_keys('(//*[@title="Search: All Text Columns"])', 'xpath', name)
    press_xpath_button('(//*[@data-action="search"])')
    time.sleep(1)
    press_xpath_button('(//*[@aria-selected="true"])[2]/td[1]')
    press_xpath_button("//*[contains(text(), 'Delete Row')]")
    press_xpath_button("//*[contains(text(), 'Save')]")
    print_result(True)
    home()
    home()
    time.sleep(1)


def create_store(name, email, adress, latitude, longitude, docUrl):
    start_test("Creating store...")
    press_css_button('.t-Header-controls button')
    press_text_button('Administration')
    press_css_button('.t-Header-controls button')
    js_href("Stores")
    switch_to_iframe('Stores')
    press_xpath_button("//*[contains(text(), 'Create')]")
    switch_to_default_content()
    switch_to_iframe('Store')
    enter_keys('.container .container .row:nth-child(1) input', 'css', name)
    enter_keys('.container .container .row:nth-child(2) input', 'css', email)
    enter_keys('.container .container .row:nth-child(3) textarea', 'css', adress)
    enter_keys('.container .container .row:nth-child(4) input', 'css', latitude)
    enter_keys('.container .container .row:nth-child(5) input', 'css', longitude)
    upload_file('.container .container .row:nth-child(6) input', 'css', docUrl)  
    press_xpath_button("//*[contains(text(), 'Create')]")
    if(detect_error() == True):
        print_info("Fail: there was an error", "2")
        press_class_button('t-Button--closeAlert')    
        press_class_button('t-Button')
        print_info('Store was not created', '1')
        result = False
    else:
        print_info("Store created", "0")
        result = True    
    switch_to_default_content()
    press_xpath_button("(//button[@title='Close'])")
    print_result(result)
    home()

def delete_store(name):
    start_test("Deleting store...")
    press_css_button('.t-Header-controls button')
    press_text_button('Administration')
    press_css_button('.t-Header-controls button')
    js_href("Stores")
    switch_to_iframe('Stores')
    press_class_button('a-Button--noUI')
    print_info('If above failed there is no active search', '0')
    enter_keys('a-IRR-search-field', 'class', name)
    press_class_button('a-IRR-button--search')
    time.sleep(1)
    press_class_button('fa-edit')
    switch_to_default_content()
    switch_to_iframe('Store') 
    press_xpath_button("//*[contains(text(), 'Delete')]")
    switch_to_default_content()
    press_class_button('js-confirmBtn')
    press_xpath_button('(//*[@title="Close"])')
    print_info("Store deleted", "0")
    print_result(True)
    home()
    time.sleep(1)

def create_other_order(name, status, store):
    start_test("Creating order...")
    press_css_button('.t-Header-controls button')
    press_xpath_button("(//a[text()='Orders'])[2]")
    press_css_button('.t-Header-controls button')
    press_xpath_button("//*[contains(text(), 'Create')]")
    date_picker()
    press_css_button('.container .container .row:nth-child(2) select')
    select_option('.container .container .row:nth-child(2) select', 'css', name)
    press_css_button('.container .container .row:nth-child(3) input')
    enter_keys('.container .container .row:nth-child(3) input', 'css', status)
    press_css_button('.container .container .row:nth-child(4) select')
    select_option('.container .container .row:nth-child(4) select', 'css', store)
    press_xpath_button("//*[contains(text(), 'Create')]")
    if detect_error():
        print_info("Fail: there was an error", "2")
        press_class_button('t-Button--closeAlert')   
        print_info('Order not created', '1')
        result = False
    else:
        print_info("Order created", "0")
        result = True
    print_result(True)
    home()
    time.sleep(1)

def edit_other_order(name, product_id, price, quantity):
    start_test("Editing order...")
    press_css_button('.t-Header-controls button')
    press_xpath_button("(//a[text()='Orders'])[2]")
    press_css_button('.t-Header-controls button')
    press_class_button('a-Button--noUI')
    print_info('If above failed there is no active search', '0')
    enter_keys('(//*[@title="Search Report"])', 'xpath', name)
    press_class_button('a-IRR-button--search')
    time.sleep(1)
    press_class_button('fa-edit')
    press_xpath_button('(//*[@data-action="selection-add-row"])')
    clear_input('(//*[@aria-selected="true"])/td[2]/div/input', 'xpath')
    press_xpath_button('(//*[@aria-selected="true"])/td[2]')
    enter_keys('(//*[@aria-selected="true"])/td[2]/div/input', 'xpath', '1')
    press_xpath_button('(//*[@aria-selected="true"])/td[3]')
    enter_keys('(//*[@aria-selected="true"])/td[3]/div/input', 'xpath', '1')
    press_xpath_button('(//*[@aria-selected="true"])/td[4]')
    select_option('(//*[@aria-selected="true"])/td[4]/div/select', 'xpath', product_id)
    press_xpath_button('(//*[@aria-selected="true"])/td[5]')
    enter_keys('(//*[@aria-selected="true"])/td[5]/div/input', 'xpath', price)
    press_xpath_button('(//*[@aria-selected="true"])/td[6]')
    enter_keys('(//*[@aria-selected="true"])/td[6]/div/input', 'xpath', quantity)
    press_class_button('t-Button--hot')
    if detect_error():
        print_info("Fail: there was an error", "2")
        press_class_button('t-Button--closeAlert')   
        press_xpath_button("//span[contains(text(), 'Delete')]/parent::*")
        press_class_button('ui-button--danger')
        print_info('Order not edited', '1')
        result = False
    else:
        print_info("Order edited", "0")
        result = True
    print_result(True)
    home()
    time.sleep(1)



def delete_other_order(name):
    start_test("Deleting order...")
    press_css_button('.t-Header-controls button')
    press_xpath_button("(//a[text()='Orders'])[2]")
    press_css_button('.t-Header-controls button')
    press_class_button('a-Button--noUI')
    print_info('If above failed there is no active search', '0')
    time.sleep(1)
    enter_keys('(//*[@title="Search Report"])', 'xpath', name)
    press_class_button('a-IRR-button--search')
    time.sleep(1)
    press_class_button('fa-edit')
    press_xpath_button("//*[contains(text(), 'Delete')]")
    press_class_button('js-confirmBtn')
    print_info("Order deleted", "0")
    print_result(True)
    home()
    home()

#-------------------------
# iFrames functions
#-------------------------

def switch_to_iframe(title):
    #switch to iframe by using the title attribute
    print_info("Switching to iframe...: " + str(title), "0")
    try:
        iframe = get_element("//div[@class='ui-dialog-content ui-widget-content js-dialogReady']/iframe[@title='"+ str(title) +"']", 'xpath')
        print_info("iFrame found!", "0")
    except Exception as e:
        print_info("iFrame not found!", "1")
        return

    try:
        browser.switch_to.frame(iframe)
        print_info("Switched to iframe", "0")
    except Exception as e:
        print_info("Could not switch to iframe", "1")
        return

def switch_to_default_content():
    #switch to default content
    print_info("Switching to default content...", "0")
    try:
        browser.switch_to.default_content()
        print_info("Switched to default content", "0")
    except Exception as e:
        print_info("Could not switch to default content", "1")
        return
    
def end_test():
    print_final_result()
    browser.quit()
    print_info("Browser closed", "0")
    print_info("Test ended", "0")