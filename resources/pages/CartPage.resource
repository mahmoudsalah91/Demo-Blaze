*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../pages/setup.resource
*** Variables ***
${addToCart_Btn}      //a[text()='Add to cart']
${productName_Txt}    //h2[@class='name']
${productPrice_txt}   //h3[@class="price-container"]
${cart_Btn}   cartur

${wait}     60
*** Keywords ***
Confirm product addto cart
     wait until element is visible    ${cart_Btn}       ${wait}
     click element    ${cart_Btn}

     Load JSON Data
     ${product} =    Set Variable    ${json_data['product']}
     ${productTitle_xpath}=  Set Variable  //td[normalize-space()='${product['title']}']
     wait until element is visible    ${productTitle_xpath}     ${wait}
     ${productName_Txt}=    Get Text    ${productTitle_xpath}

     should be equal    ${product['title']}     ${productName_Txt}


     ${price}=    Remove String    ${product['price']}    $
     log    ${price}
     ${productPrice_xpath}=  Set Variable  //td[normalize-space()='${price}']
     ${productPrice_Txt}=    Get Text    ${productPrice_xpath}


     should be equal    ${productPrice_Txt}     ${price}






