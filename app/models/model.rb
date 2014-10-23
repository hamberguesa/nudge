require_relative 'nudge'
require 'twilio-ruby'
require 'dotenv'
require 'active_record'
Dotenv.load

class Worker 
	attr_reader :last_response, :last_request

	account_sid = ENV['ACCT_SID']
	auth_token = ENV['AUTH_TOKEN']

	@client = Twilio::REST::Client.new account_sid, auth_token 

	def self.search_database
		nudges = Nudge.all
		now = Time.new

		nudges.each do |nudge|
			nudge_time = Time.parse(nudge.datetime)
			if nudge_time > (now - 150000) && nudge_time < (now + 150000) 
				send_text(nudge.message)
			end
		end
	end

	def send_text(message)
		@client.account.messages.create({
			:from => '+14159677811', 
			:to => '4154305552', 
			:body => message,  
		})
	end
end
