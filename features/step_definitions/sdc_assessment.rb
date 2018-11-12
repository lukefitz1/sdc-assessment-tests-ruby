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