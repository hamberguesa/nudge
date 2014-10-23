require_relative 'spec_helper'
require 'faker'

describe 'GET /nudges' do
	before(:each) do
		Nudge.delete_all
		5.times do
			Nudge.create(receiver_name: Faker::Lorem.word, phone_num: '4156678888', message: Faker::Lorem.word, datetime: DateTime.now, user_id: 1)
		end

		get '/nudges'
	end

	it "should display all nudges" do
		Nudge.all.each do |nudge|
			expect(last_response.body).to include(nudge.name)
		end
	end

	it 'should show the status of the page' do
		expect(last_response).to be_ok
	end
end

describe 'POST /nudges/create' do
	context "when the request has valid paramters" do
	
		before(:each) do
			Nudge.delete_all
			@nudge = {:receiver_name => Faker::Lorem.word, :phone_num => '4156678888', :message => Faker::Lorem.word, :datetime => DateTime.now, :user_id => 1}
		end

		it "creates a new nudge" do
			expect{
				post '/nudges/create', @nudge
			}.to change{Nudge.all.count}.by(1)
		end

		# it "redirects the user" do
		# 	post '/nudges/create', @nudge
		# 		expect(last_response).to be_redirect
		# end
	end

	context "when the request does not include a body value" do
		before(:each) do
			Nudge.delete_all
			@nudge = {:receiver_name => Faker::Lorem.word}
		end

		it "does not create a new nudge" do
			expect{
				post '/nudges/create', @nudge
			}.to change {Nudge.all.count}.by(0)
		end
	end

	context "when the request does not include a unique username value" do
		before(:each) do
			User.delete_all
			@user = {:name => Faker::Lorem.word, :username => 'test', :email => 'ah@test.com', :password => 'password'}
			@user2 = {:name => Faker::Lorem.word, :username => 'test', :email => 'gb@test.com', :password => 'password'}

		post '/signup', @user
		post '/signup', @user2
		end

		it "does not create a new user" do
			expect{
				post '/signup', @user2
			}.to change {User.all.count}.by(0)
		end
	end
end