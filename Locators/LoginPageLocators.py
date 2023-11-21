# Locator names
USER_NAME_LOCATOR = "id=user-name"
PASSWORD_LOCATOR = "id=password"
LOGIN_BTN_LOCATOR = "id=login-button"
ERROR_MSG_LOCATOR = "class:error-message-container.error"

# Text in error messages
ERROR_MSG_TEXT = "Epic sadface: Username and password do not match any user in this service"
EMPTY_USERNAME_ERROR_MSG = "Epic sadface: Username is required"
EMPTY_PASSWORD_ERROR_MSG = "Epic sadface: Password is required"
ERROR_MSG_FOR_LOCKED_USER = "Epic sadface: Sorry, this user has been locked out."

# User names
STANDARD_USER_NAME = "standard_user"
USER_WITH_GLITCH_NAME = "performance_glitch_user"
PROBLEM_USER = "problem_user"
LOCKED_USER = "locked_out_user"
ERROR_USER = "error_user"
VISIAL_USER = "visual_user"
ORDINARY_USER = "ordinary_user"
SHORT_USERNAME = "St"
LONG_USERNAME = "Steeeeeeeeeeeeeeffffffffffffaaaaaannnnnnniiiiiiaaa"
SQL_INJECTION_USERNAME = "SELECT * FROM users WHERE login = '¿' OR 1=1; --"
USERNAME_WITH_HTML_TAG = "<form action=”http://live.hh.ru”><input type=”submit”></form>"

# Passwords
CORRECT_PASSWORD = "secret_sauce"
INCORRECT_PASSWORD = "row45Qwp45gf"
SHORT_PASSWORD = "kre"
LONG_PASSWORD = "ddlldfkfkfkk12234rfgjfkcdlxsxdcfvbgfr45rtyghlhktmrk"
PASSWORD_WITH_SPECIAL_CHR = "qw!f@c#fl58'h"

# TODO move cart_link to ProductPageLocators.py when it will be created
CART_LINK = "class:shopping_cart_link"
