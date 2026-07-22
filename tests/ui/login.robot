*** Settings ***
Resource         ../../resources/ui/login_page.robot
Test Setup       Open Login Page
Test Teardown    Close Browser


*** Test Cases ***
Valid Login Shows The Admin Dashboard
    [Tags]    ui    smoke    auth
    Login As    ${ADMIN_USER}    ${ADMIN_PASSWORD}
    Login Should Succeed

Invalid Login Shows An Error Message
    [Tags]    ui    negative    auth
    Login As    ${ADMIN_USER}    wrongpassword
    Login Should Fail With Error    Invalid credentials
