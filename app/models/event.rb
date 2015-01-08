require 'active_support/core_ext/date/calculations.rb'

class Event < ActiveRecord::Base
	has_many :event_attendances, :foreign_key => :attended_event_id
	has_many :attendees, :through => :event_attendances
	belongs_to :creator, :class_name => "User"
	scope :upcoming, -> { where("date >= ?", Date.current) }
	scope :past, -> { where("date < ?", Date.current) }
end
