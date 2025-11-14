Feature: Payment Page Validation

  Background:
    Given the user is on the Payment page
    And all payment fields (Name on Card, Card Number, CVC, Expiration Month, Expiration Year) are visible

  Scenario: Verify successful payment with valid details
    When the user enters a valid Name on Card
    And enters a valid 16-digit Card Number
    And enters a valid 3-digit CVC
    And enters a valid expiration month and year
    And clicks on "Pay and Confirm Order"
    Then the system should display the message "Your order has been placed successfully!"

  Scenario: Verify validation when all fields are empty
    When the user leaves all fields empty
    And clicks on "Pay and Confirm Order"
    Then an error message should be displayed indicating required fields

  Scenario: Verify invalid card number (less than 16 digits)
    When the user enters a card number with less than 16 digits
    And clicks on "Pay and Confirm Order"
    Then the system should display a validation error for invalid card number

  Scenario: Verify alphabetic input in numeric fields
    When the user enters alphabetic characters in the Card Number or CVC field
    And clicks on "Pay and Confirm Order"
    Then the system should display an error indicating invalid input format

  Scenario: Verify expired card
    When the user enters an expiration date that has already passed
    And clicks on "Pay and Confirm Order"
    Then the system should display an error message indicating the card has expired

  Scenario: Verify missing CVC
    When the user fills all fields except CVC
    And clicks on "Pay and Confirm Order"
    Then the system should display an error message for missing CVC

  Scenario: Verify correct input length
    When the user enters a 16-digit card number and 3-digit CVC
    Then the system should accept the input without errors

  Scenario: Verify expiration month and year validation
    When the user enters a month greater than 12 or less than 1
    Then the system should display a validation message for invalid month
    When the user enters a year shorter than 4 digits
    Then the system should prompt the user to enter a valid year

  Scenario: Verify pay button behavior during processing
    When the user clicks on "Pay and Confirm Order" with valid data
    Then the button should be temporarily disabled
    And the system should process the payment once

  Scenario: Verify secure connection on payment page
    When the user is on the payment page
    Then the page URL should start with "https://"
    And payment data should be transmitted securely

  Scenario: Verify success message after order placement
    When the user completes payment successfully
    Then the system should display "Your order has been placed successfully!"
    And the user should be redirected to the order confirmation page

