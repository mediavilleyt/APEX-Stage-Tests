total_tests = 0
total_passed = 0
total_failed = 0

def start_test(name):
    global total_tests
    total_tests += 1
    print("-------------------------------------------------------------------")
    print("\033[93m" + "Test started: " + name + "\033[0m")

def print_info(string, type):
    if (type == "0"):
        print("     ->" + string)

    elif(type == "1"):
        print("\033[31m" + "     ->" + string + "\033[0m")

    elif(type == "2"):
        print("\033[93m" + "     ->" + string + "\033[0m")

def print_result(result):
    global total_passed
    global total_failed
    if result:
        total_passed += 1
        print("\033[92m" + "     ->Test passed" + "\033[0m")
    else:
        total_failed += 1
        print("\033[91m" + "     ->Test failed" + "\033[0m")
    print("-------------------------------------------------------------------")

def print_final_result():
    print("\n\033[92m" + "Total tests passed: " + str(total_passed) + "\033[0m")
    print("\033[91m" + "Total tests failed: " + str(total_failed) + "\033[0m")
    print("\033[93m" + "Total tests: " + str(total_tests) + "\033[0m")
    if total_failed == 0:
        print("\033[92m" + "All tests passed" + "\033[0m")
    else:
        print("\033[91m" + "Some tests failed" + "\033[0m")
        