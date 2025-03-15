## Overview
This is a Robot Framework-based test automation project for testing the Demoblaze e-commerce website (https://www.demoblaze.com/). The project follows the Page Object Model pattern to provide maintainable and scalable test automation.

## Project Structure

```
demoblaze/
├── resources/
│   ├── pages/
│   │   ├── CartPage.resource
│   │   ├── HomePage.resource
│   │   ├── LoginPage.resource
│   │   ├── ProductDetailsPage.resource
│   │   └── setup.resource
│   └── TestData/
│       └── test_data.json
└── tests/
    └── AddToCart.robot
```

## Prerequisites

- Python 3.9+
- Robot Framework
- Selenium Library for Robot Framework
- JSON Library for Robot Framework
- Chrome browser

## Installation

1. Clone the repository:
```bash
git clone https://github.com/your-username/demoblaze.git
cd demoblaze
```

2. Create a virtual environment:
```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install robotframework robotframework-seleniumlibrary robotframework-jsonlibrary
```

## Test Data Configuration

Test data is stored in JSON format at test_data.json. The JSON structure includes:

```json
{
  "loginData": {
    "user": "admin",
    "password": "admin",
    "expectedResult": "success"
  },
  "product": {
    "title": "HTC One M9",
    "price": "$700"
  }
}
```

## Running Tests

To run the add to cart test:

```bash
robot --argumentfile arg.txt ./tests/AddToCart.robot
```

To run by batch file directly:

```bash
.\run.bat
```

## Test Flow

The main test case in AddToCart.robot covers the following workflow:

1. Opening the browser
2. Logging in with valid credentials
3. Navigating to a product page
4. Adding the product to the cart
5. Confirming the product has been added to the cart

## Page Objects

The project implements the Page Object Model pattern with the following pages:

- HomePage.resource: Handles interactions with the home page
- LoginPage.resource: Login functionality
- ProductDetailsPage.resource: Product details page actions
- CartPage.resource: Cart page interactions
- setup.resource: Common setup and teardown operations

## Author

Mahmoud Salah 
Senior Software Tester Engineer
