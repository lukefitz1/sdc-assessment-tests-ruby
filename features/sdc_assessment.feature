Feature: SDC Assessment
Description: Testing the checkout and account signup workflow
	
  Background: Starting on the cart page with a product in the cart already
    Given Luke is on the cart page with a product in his cart

  Scenario: Customer atttempts to place order without an email address
    And He has not entered his email on checkout
    When He attemps to place an order
    Then The Email is Required error message is displayed

  Scenario: Customer completes account sign up form after placing order
    And He has completed checkout
    When Fills out the account signup form
    And Submits the account signup form
    Then His account is created successfully

  Scenario: Customer cannot complete account sign up form when passwords don't match
    And He has completed checkout
    When He attempts to create a new account with differing password and confirm passwords
    And Submits the account signup form
    Then The Passwords do not match error is displayed

  Scenario: Customer cannot complete account sign up form without selecting terms & conditions
    And He has completed checkout
    When He attempts to create a new account without agreeing to the terms and conditions
    And Submits the account signup form
    Then The Terms and Conditions error message is displayed

  Scenario: Customer cannot complete account sign up form if they are under 18 years old
    And He has completed checkout
    When He attempts to create a new account but is under 18 years old
    And Submits the account signup form
    Then The You Must Be 18 years or older to sign up for an account error message is displayed
