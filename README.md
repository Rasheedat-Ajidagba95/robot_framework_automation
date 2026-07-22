# Robotic Framework — Login Test Suite

Automated UI and API tests for the login flow of the
[Restful Booker Platform](https://automationintesting.online) demo app,
built with Robot Framework and the Browser (Playwright) + Requests libraries.

## Structure

    tests/            what we test
      ui/             browser tests (Browser library)
      api/            API tests (RequestsLibrary)
    resources/        how we test it — reusable keywords
      ui/             page objects (locators + actions)
      api/            API request keywords
    variables/        environment config (URLs, credentials, browser)

Tests describe *what* to check; resources hold *how* it's done; all
environment data lives in `variables/env.py`.

## Setup

    pip install -r requirements.txt
    rfbrowser init          # installs Playwright browsers (first time only)

## Running

    robot tests/                    # everything
    robot tests/ui/                 # UI only
    robot tests/api/                # API only
    robot --include smoke tests/    # smoke tests only

Reports are written to `report.html` and `log.html`.
