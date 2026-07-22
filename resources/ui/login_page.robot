*** Settings ***
Library     Browser
Variables   ../../variables/env.py


*** Variables ***
${USERNAME_FIELD}   id=username
${PASSWORD_FIELD}   id=password
${LOGIN_BUTTON}     id=doLogin
${ERROR_MESSAGE}    css=.alert-danger


*** Keywords ***
Open Login Page
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page       ${UI_URL}

Login As
    [Arguments]    ${username}    ${password}
    Fill Text    ${USERNAME_FIELD}    ${username}
    Fill Text    ${PASSWORD_FIELD}    ${password}
    Click        ${LOGIN_BUTTON}

Login Should Succeed
    Wait For Elements State    text=Rooms    visible
    Get Url    contains    /admin/rooms

Login Should Fail With Error
    [Arguments]    ${expected_message}
    Wait For Elements State    ${ERROR_MESSAGE}    visible
    Get Text    ${ERROR_MESSAGE}    contains    ${expected_message}
