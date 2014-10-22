class Nudge < ActiveRecord::Base
	validates :phone_num, presence: true
	validates :phone_num, :format => { :with => /\A\W\d(\d{10})/ }
	validates :message, presence: true
	validates :datetime, presence: true

	belongs_to :user

end
