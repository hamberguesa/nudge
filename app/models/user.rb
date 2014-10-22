require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true
	validates :name, presence: true
	validates :username, presence: true, uniqueness: true

	has_many :nudges

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

	def self.authenticate(id)
		return nil if id.nil?
		return User.find(id)
	end
end
