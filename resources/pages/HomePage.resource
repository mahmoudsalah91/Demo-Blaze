*** Settings ***
Library     SeleniumLibrary
Resource    ../pages/setup.resource
*** Variables ***
${login_link}  login2
${cart_Btn}   cartur
${elements}    //a[@class="hrefch"]
${wait}     60
*** Keywords ***
click on Login button
    wait until element is visible     ${login_link}   ${wait}
    click element    ${login_link}

Navigate to product page
    ${allElements} =  get webelements    ${elements}
    FOR     ${element}   IN    @{allElements}
    ${element_title} =    get text    ${element}
    Load JSON Data
    ${product} =    Set Variable    ${json_data['product']}
    Scroll Element Into View    //a[text()='${product['title']}']
    Run Keyword If    '${element_title}' == '${product['title']}'    Click Element    ${element}
    Exit For Loop If    '${element_title}' == '${product['title']}'
    END


click on Cart button
    wait until element is visible     ${cart_Btn}   ${wait}
    click element    ${cart_Btn}
