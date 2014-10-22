class Seed
	def self.run
		User.create(name: 'Amber', username: 'hamberguesa', email: 'amh@gmail.com', password: "password")
		User.create(name: 'Andrew', username: 'hubby', email: 'aah@gmail.com', password: "password")
	end
end


