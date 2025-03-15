*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../pages/setup.resource
*** Variables ***
${addToCart_Btn}      //a[text()='Add to cart']
${productName_Txt}    //h2[@class='name']
${productPrice_txt}   //h3[@class="price-container"]

${wait}     60
*** Keywords ***
Add product to cart
     wait until element is visible    ${productName_Txt}       ${wait}
     ${productname} =    get text    ${productName_Txt}
     Load JSON Data
     ${product} =    Set Variable    ${json_data['product']}
     should be equal    ${productname}     ${product['title']}

    wait until element is visible     ${productPrice_txt}       ${wait}
    ${full_price_text}=    Get Text    ${productPrice_txt}
    ${price}=    Evaluate    '${full_price_text}'.split()[0]
    Log    Price: ${price}
    should be equal    ${product['price']}     ${price}


     wait until element is visible    ${addToCart_Btn}       ${wait}
     click element    ${addToCart_Btn}
     alert should be present