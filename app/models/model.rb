require 'twilio-ruby'
require 'dotenv'
require 'active_record'
Dotenv.load
require_relative 'nudge'

class Worker 
	attr_reader :last_response, :last_request

	account_sid = ENV['ACCT_SID']
	auth_token = ENV['AUTH_TOKEN']

	account_sid = 'AC6090c1b7becb69836694649bdf2dc4ee'
	auth_token = '608b52f087b35b81bb5d1ac556715945'

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
