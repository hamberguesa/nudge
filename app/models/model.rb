require 'dotenv'
Dotenv.load
require 'twilio-ruby'
require 'active_record'
require_relative '../../config/environment.rb'
require_relative '../../config/database.rb'
# require_relative 'nudge'

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
				send_text(nudge.phone_num, nudge.message)
			end
		end
	end

	def send_text(phone_num, message)
		@client.account.messages.create({
			:from => '+14159677811', 
			:to => phone_num, 
			:body => message,  
		})
	end
end
