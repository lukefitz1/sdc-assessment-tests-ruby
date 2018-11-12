require_relative './base_page_object'

module PageObjects
	class CartPage < BasePageObject
		include Capybara::DSL

		def initialize
			@email_input = '#order_email'
			@email_error_message = '#empty-email'
			@place_order_btn = 'body > form > div.actions > input[type="submit"]'
		end

		def click_place_order_btn
			click(@place_order_btn)
		end

		def wait_for_email_input
			wait_for(@email_input)
		end

		def wait_for_email_error_message
			wait_for(@email_error_message)
		end

		def get_email_error_message_text
			text(@email_error_message)
		end

		def set_email
			set(@email_input, 'test@test.com')
		end

	end
end
