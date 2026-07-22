*** Settings ***
Resource       ../../resources/api/auth_api.robot
Suite Setup    Create API Session


*** Test Cases ***
Login With Valid Credentials Should Return 200
    [Tags]    api    smoke    auth
    ${response}=    Send Login Request    ${ADMIN_USER}    ${ADMIN_PASSWORD}
    Should Be Equal As Numbers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    token

Login With Invalid Password Should Return 401
    [Tags]    api    negative    auth
    ${response}=    Send Login Request    ${ADMIN_USER}    WrongPassword
    Should Be Equal As Numbers    ${response.status_code}    401
    Should Be Equal    ${response.json()}[error]    Invalid credentials
