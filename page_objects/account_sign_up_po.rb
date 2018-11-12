require_relative './base_page_object'

module PageObjects
	class AccountSignUpPage < BasePageObject
		include Capybara::DSL

		def initialize
			@signup_form = 'body > form'
			@password_input = '#password'
			@confirm_password_input = '#confirm_password'
			@this_order_is_for_me_radio = '#order_for_me'
			@dob_month_input = '#dob_month'
			@dob_day_input = '#dob_day'
			@dob_year_input = '#dob_year'
			@tc_checkbox = '#tc_checkbox'
			@create_account_btn = 'body > form > div.actions > input[type="submit"]'
			@passwords_mismatch_error = '#passwords-dont-match'
		end

		def wait_for_signup_form
			wait_for(@signup_form)
		end

		def wait_for_password_mismatch_error
			wait_for(@passwords_mismatch_error)
		end

		def complete_signup_form
			set(@password_input, 'Password1')
			set(@confirm_password_input, 'Password1')
			click(@this_order_is_for_me_radio)
			set(@dob_month_input, '03')
			set(@dob_day_input, '12')
			set(@dob_year_input, '1988')
			click(@tc_checkbox)
		end

		def complete_signup_form_different_passwords
			set(@password_input, 'Password1')
			set(@confirm_password_input, 'Password2')
			click(@this_order_is_for_me_radio)
			set(@dob_month_input, '03')
			set(@dob_day_input, '12')
			set(@dob_year_input, '1988')
			click(@tc_checkbox)
		end

		def click_create_account_btn
			click(@create_account_btn)
		end

		def get_passwords_mismatch_error
			text(@passwords_mismatch_error)
		end

	end
end
