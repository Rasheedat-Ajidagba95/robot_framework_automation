*** Settings ***
Library     RequestsLibrary
Library     Collections
Variables   ../../variables/env.py


*** Keywords ***
Create API Session
    Create Session    api    ${API_URL}

Send Login Request
    [Arguments]    ${username}    ${password}
    ${payload}=    Create Dictionary    username=${username}    password=${password}
    ${response}=    POST On Session    api    /auth/login    json=${payload}    expected_status=any
    RETURN    ${response}
