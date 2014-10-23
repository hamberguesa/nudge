require 'twilio-ruby'
require 'dotenv'
Dotenv.load

module Nudge

	class Client
		attr_reader :last_response, :last_request

		account_sid = ENV['ACCT_SID']
		auth_token = ENV['AUTH_TOKEN']
 
	@client = Twilio::REST::Client.new account_sid, auth_token 
 
		def send_text(message)
			@client.account.messages.create({
				:from => '+14159677811', 
				:to => '4154305552', 
				:body => message,  
			})
		end
	end
end