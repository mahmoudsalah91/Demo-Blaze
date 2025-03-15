*** Settings ***
Resource       ../resources/pages/setup.resource
Resource       ../resources/pages/HomePage.resource
Resource       ../resources/pages/LoginPage.resource
Resource       ../resources/pages/ProductDetailsPage.resource
Resource       ../resources/pages/CartPage.resource


Suite Setup       open my browser
Suite Teardown    teardown all browsers


*** Test Cases ***
user can add product to card succes
    Given Login With Valid Data
    When Navigate to product page
    Then Add product to cart
    And Confirm product add to cart