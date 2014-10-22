require 'twilio-ruby'
require 'dotenv'
Dotenv.load

module Nudge

	class Client
		attr_reader :last_response, :last_request

		acct_sid = ENV['ACCT_SID']
		auth_token = ENV['AUTH_TOKEN']

	Twilio.configure do |config|
	  config.account_sid = acct_sid
	  config.auth_token = auth_token
	end

	end
end