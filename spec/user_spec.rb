require_relative 'spec_helper'

describe User do 
	context '#associations' do 
		it { should have_many :nudges }
	end
end