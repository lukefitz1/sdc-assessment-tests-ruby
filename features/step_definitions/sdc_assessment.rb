Given("Luke is on the cart page with a product in his cart") do
  visit 'https://sdc-assessment.herokuapp.com'

  @cart = PageObjects::CartPage.new
end

Given("He has not entered his email on checkout") do
  # Dont need to do anything here, since we are not filling out a field
end

When("He attemps to place an order") do
  @cart.click_place_order_btn
end

Then("The Email is Required error message is displayed") do
  @cart.wait_for_email_error_message
  expect(@cart.get_email_error_message_text).to eq("Email is required")
end

Given("He has completed checkout") do
  @cart.wait_for_email_input
  @cart.set_email
  @cart.click_place_order_btn
end

When("Fills out the account signup form") do
  @signup = PageObjects::AccountSignUpPage.new
  @signup.wait_for_signup_form
  @signup.complete_signup_form
end

When("Submits the account signup form") do
  @signup.click_create_account_btn
end

Then("His account is created successfully") do
  @success = PageObjects::AccountCreateSuccessPage.new
  @success.wait_for_page_heading
  @success.wait_for_continue_shopping_link

  expect(@success.get_page_heading_text).to eq('Account Created successfully!')
end

When("He attempts to create a new account with differing password and confirm passwords") do
  @signup = PageObjects::AccountSignUpPage.new
  @signup.wait_for_signup_form
  @signup.complete_signup_form_different_passwords
end

Then("The Passwords do not match error is displayed") do
  @signup.wait_for_password_mismatch_error

  expect(@signup.get_passwords_mismatch_error).to eq('Passwords do not match!')
end

When("He attempts to create a new account without agreeing to the terms and conditions") do
  @signup = PageObjects::AccountSignUpPage.new
  @signup.wait_for_signup_form
  @signup.complete_signup_form_no_terms
end

Then("The Terms and Conditions error message is displayed") do
  @signup.wait_for_terms_and_conditions_error

  expect(@signup.get_terms_and_conditions_error).to eq('Terms and Conditions must be accepted')
end

When("He attempts to create a new account but is under 18 years old") do
  @signup = PageObjects::AccountSignUpPage.new
  @signup.wait_for_signup_form
  @signup.complete_signup_form_underage
end

Then("The You Must Be 18 years or older to sign up for an account error message is displayed") do
  @signup.wait_for_underage_error

  expect(@signup.get_underage_error).to eq('You must be 18 years or older to sign up')
end