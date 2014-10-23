require_relative 'spec_helper'

describe Nudge do
	context '#associations' do
		it { should belong_to :user }
	end
end