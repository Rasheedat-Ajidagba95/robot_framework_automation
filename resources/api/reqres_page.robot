*** Settings ***
Library     RequestsLibrary
Library     Collections
Variables   ../../variables/env.py


*** Keywords ***
Create Session To API
    &{headers}=    Create Dictionary    x-api-key=${API_KEY}    Content-type=application/json
    Create Session    api    ${API_URL}    headers=${headers}

Send Login Request
    [Arguments]    ${email}    ${password}
    &{payload}=    Create Dictionary    email=${email}    password=${password}
    ${response}=    POST On Session    api    api/login    json=${payload}    expected_status=any
    RETURN    ${response}

Login With Options
    [Arguments]    ${email}    ${password}    
    
    &{payload}=    Create Dictionary   

    IF    '${email}' != '${EMPTY}'   
       Set To Dictionary    ${payload}    email    ${email}
    END
    IF    '${password}' != '${EMPTY}'
       Set To Dictionary    ${payload}    password    ${password}
    END
    ${response}=    POST On Session    api    api/login    json=${payload}    expected_status=any 
    RETURN    ${response}

Send Register Request
    [Arguments]    ${email}    ${password}
    &{payload}=    Create Dictionary    email=${email}    password=${password}
    ${response}=    POST On Session    api    api/register    json=${payload}    expected_status=any
    RETURN    ${response}

