# Config for the test suite. Swap these per environment.

import os
from dotenv import load_dotenv

load_dotenv()


API_URL = "https://reqres.in"
API_KEY = os.getenv("API_KEY", "")

API_EMAIL = "eve.holt@reqres.in"
API_PASSWORD = "cityslicka"

UI_URL = "https://automationintesting.online/admin"

ADMIN_USER = "admin"
ADMIN_PASSWORD = "password"  


BROWSER = "chromium"
HEADLESS = False
