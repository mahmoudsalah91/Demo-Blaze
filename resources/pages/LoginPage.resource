*** Settings ***
Library     SeleniumLibrary
Resource    ../pages/HomePage.resource
Resource    ../pages/setup.resource


*** Variables ***
${user_Txt}      loginusername
${Password_Txt}   loginpassword
${login_Btn}     //button[text()='Log in']
${logout_Btn}    logout2
${wait}     60
*** Keywords ***
Login With Valid Data
    click on Login button
    Load JSON Data
    ${user} =    Set Variable    ${json_data['loginData']}
    Log User In    ${user['user']}    ${user['password']}    ${user['expectedResult']}



Log User In
    [Arguments]    ${userName}    ${Password}    ${ExpectedResult}
    wait until element is visible    ${user_Txt}    ${wait}
    input text    ${user_Txt}    ${userName}
    wait until element is visible    ${Password_Txt}    ${wait}
    input text    ${Password_Txt}    ${Password}
    click button    ${login_Btn}
    IF    '${ExpectedResult}' == 'success'
       wait until element is visible    ${logout_Btn}   ${wait}
       element should be visible    ${logout_Btn}
    END