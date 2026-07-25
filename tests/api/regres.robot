*** Settings ***

Resource    ../../resources/api/reqres_page.robot
Suite Setup    Create Session To API



*** Test Cases ***

Login With Valid Credentials Should Return 200 and Token
    [TAGS]    api    smoke    auth
    ${response}=    Login With Options    ${API_EMAIL}    ${API_PASSWORD}
    Should Be Equal As Numbers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    token


Invalid Login With Attempts Should Return 400 and Error Message
    [TAGS]    api    negative    auth
    
    [Template]    Login Should fail With Error

    #email          #password          #expected_error_message
    ${API_EMAIL}    ${EMPTY}            Missing password
    ${EMPTY}        ${API_PASSWORD}     Missing email or username
    ${EMPTY}        ${EMPTY}            Missing email or username


*** Keywords ***
Login Should fail With Error
    [Arguments]    ${email}    ${password}    ${expected_error_message}
    ${response}=    Login With Options    ${email}    ${password}
    Should Be Equal As Numbers    ${response.status_code}    400
    Dictionary Should Contain Key    ${response.json()}    error
    Should Be Equal As Strings    ${response.json()['error']}    ${expected_error_message}