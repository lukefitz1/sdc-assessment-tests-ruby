require_relative './base_page_object'

module PageObjects
	class AccountCreateSuccessPage < BasePageObject
		include Capybara::DSL

		def initialize
			@page_heading = 'body > div > h1'
			@continue_shopping_link = 'body > div > a'
		end

		def get_page_heading_text
			text(@page_heading)
		end

		def wait_for_page_heading
			wait_for(@page_heading)
		end

		def wait_for_continue_shopping_link
			wait_for(@continue_shopping_link)
		end

	end
end
