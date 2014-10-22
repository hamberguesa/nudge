class Nudge < ActiveRecord::Base
	validates :phone_num, presence: true
	validates :phone_num, :format => { :with => /\A(\d{10})/ }
	validates :message, presence: true
	validates :date, presence: true
	validates :time, presence: true

	belongs_to :user

end
