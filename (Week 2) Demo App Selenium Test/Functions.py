from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait, Select
from selenium.webdriver.support import expected_conditions as EC
from selenium import webdriver
#selenium import find_element

from selenium.webdriver.common.keys import Keys
from Printer import print_info
import os, sys, time, datetime

#-------------------------
# Setup
#-------------------------

# Set up the browser
browser = webdriver.Edge()

#-------------------------
# Get Stuff
#-------------------------

def get_element(string, expected_type):
    try:
        if(expected_type == 'id'):
            element = WebDriverWait(browser, 10).until(EC.presence_of_element_located((By.ID, string)))
        elif(expected_type == 'class'):
            element = WebDriverWait(browser, 10).until(EC.presence_of_element_located((By.CLASS_NAME, string)))
        elif(expected_type == 'xpath'):
            element = WebDriverWait(browser, 10).until(EC.presence_of_element_located((By.XPATH, string)))
        elif(expected_type == 'name'):
            element = WebDriverWait(browser, 10).until(EC.presence_of_element_located((By.NAME, string)))
        elif(expected_type == 'css'):
            element = WebDriverWait(browser, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, string)))
        elif(expected_type == 'text'):
            element = WebDriverWait(browser, 10).until(EC.presence_of_element_located((By.LINK_TEXT, string)))
        elif(expected_type == 'tag'):
            element = WebDriverWait(browser, 10).until(EC.presence_of_element_located((By.TAG_NAME, string)))
        print_info("Element found, " + str(expected_type) + ": " + str(string), "0")
        return element
    except:
        print_info("Element not found, " + str(expected_type) + ": " + str(string), "1")
        return None

def get_elements(string, expected_type):
    try:
        if(expected_type == 'id'):
            elements = WebDriverWait(browser, 10).until(EC.presence_of_all_elements_located((By.ID, string)))
        elif(expected_type == 'class'):
            elements = WebDriverWait(browser, 10).until(EC.presence_of_all_elements_located((By.CLASS_NAME, string)))
        elif(expected_type == 'xpath'):
            elements = WebDriverWait(browser, 10).until(EC.presence_of_all_elements_located((By.XPATH, string)))
        elif(expected_type == 'name'):
            elements = WebDriverWait(browser, 10).until(EC.presence_of_all_elements_located((By.NAME, string)))
        elif(expected_type == 'css'):
            elements = WebDriverWait(browser, 10).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, string)))
        elif(expected_type == 'text'):
            elements = WebDriverWait(browser, 10).until(EC.presence_of_all_elements_located((By.LINK_TEXT, string)))
        elif(expected_type == 'tag'):
            elements = WebDriverWait(browser, 10).until(EC.presence_of_all_elements_located((By.TAG_NAME, string)))
        print_info("Elements found, " + str(expected_type) + ": " + str(string), "0")
        return elements
    except:
        print_info("Elements not found, " + str(expected_type) + ": " + str(string), "1")
        return None
    
#-------------------------

#-------------------------
# Interact functions
#-------------------------

def enter_keys(string, expected_type, keys):
    element = get_element(string, expected_type)
    try:
        element.send_keys(keys)
        print_info("Keys entered: " + str(keys), "0")
    except Exception as e:
        print_info("Could not enter keys, it is possible that the given element is not a text input field", "1")

def clear_input(string, expected_type):
    element = get_element(string, expected_type)
    try:
        element.clear()
        print_info("Cleared the input field", "0")
    except Exception as e:
        print_info("Could not clear the input field, it is possible that the given element is not a text input field", "1")

def click(string, expected_type):
    element = get_element(string, expected_type)
    try:
        element.click()
        print_info("Clicked on the element", "0")
    except Exception as e:
        print_info("Could not click on the element, it is possible that the given element is not a button", "1")

def select_option(string, expected_type, option):
    dropdown = get_element(string, expected_type)
    try:
        select = Select(dropdown)
        select.select_by_visible_text(option)
        print_info("Selected the option: " + str(option), "0")
    except Exception as e:
        print_info("Could not select " + str(option) + ",it is possible that the given element is not a dropdown", "1")

def date_picker():
    element = get_element("apex-item-datepicker", 'class')
    try:
        element.click()
        print_info("Clicked on the date picker", "0")
    except Exception as e:
        print_info("Could not click on the date picker, it is possible that the given element is not a date picker", "1")

    date = datetime.date.today()
    date = date.strftime("%m/%d/%Y")

    try:
        element.send_keys(str(date))
        print_info("Entered the date: " + str(date), "0")
    except Exception as e:
        print_info("Could not enter the date, it is possible that the given element is not a date picker", "1")

def upload_file(string, expected_type, path):
    element = get_element(string, expected_type)
    path = get_file_path(path)
    try:
        element.send_keys(path)
        print_info("Uploaded the file: " + str(path), "0")
    except Exception as e:
        print_info("Could not upload file: '" + str(path) + "', it is possible that the given element is not a file input field", "1")

def get_file_path(relative_path):
    current_dir = os.path.dirname(sys.argv[0])
    return os.path.join(current_dir, relative_path)

def enter_js_text(path, text):
    script = f"""var element = document.evaluate('{path}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; element.textContent = "{text}";"""
    browser.execute_script(script)

#-------------------------
# Easy interaction functions
#-------------------------

def press_text_button(button_name):
    click(button_name, 'text')

def press_class_button(button_name):
    click(button_name, 'class')

def press_css_button(button_name):
    click(button_name, 'css')

def press_xpath_button(button_name):
    click(button_name, 'xpath')

def press_name_button(button_name):
    click(button_name, 'name')
#-------------------------
# Get Js Href
#-------------------------

def js_href(link_name):
    # Find the link element
    link = get_element("//a[contains(@href, 'demonstration-customer-orders') and contains(@href, '" + str(link_name) + "')]", 'xpath')

    # Execute JavaScript to click on the link
    try:
        browser.execute_script("arguments[0].click();", link)
        print_info("Clicked on the link: " + str(link), "0")
    except Exception as e:
        print_info("Could not click on the link, it is possible that the given element is not a link", "1")

#-------------------------
# Check if element is visible
#-------------------------

def detect_error():
    result = False
    try:
        element = WebDriverWait(browser, 2).until(EC.visibility_of_element_located((By.CLASS_NAME, 't-Alert-wrap')))
    except:
        return result
    
    try:
        element = WebDriverWait(browser, 2).until(EC.visibility_of(element))
        result = True
    except Exception as e:
        print_info("No error message found", "0")

    if(result == True):
        texts = element.find_elements(By.TAG_NAME, "li")
        for text in texts:
            print_info(text.text, "1")

    return result

