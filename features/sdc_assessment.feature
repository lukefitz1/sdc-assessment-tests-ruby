Feature: SDC Assessment
	
  Scenario: Customer atttempts to place order without an email address
    Given Luke is on the cart page with a product in his cart
    And He has not entered his email on checkout
    When He attemps to place an order
    Then The Email is Required error message is displayed

  Scenario: Customer completes account sign up form after placing order
    Given Luke is on the cart page with a product in his cart
    And He has completed checkout
    When Fills out the account signup form
    And Submits the account signup form
    Then His account is created successfully

  Scenario: Customer cannot complete account sign up form when passwords don't match
    Given Luke is on the cart page with a product in his cart
    And He has completed checkout
    When He attempts to create a new account with differing password and confirm passwords
    And Submits the account signup form
    Then The Passwords do not match error is displayed

  Scenario: Customer cannot complete account sign up form without selecting terms & conditions
    Given Luke is on the cart page with a product in his cart
    And He has completed checkout
    When He attempts to create a new account without agreeing to the terms and conditions
    And Submits the account signup form
    Then The Terms and Conditions error message is displayed
