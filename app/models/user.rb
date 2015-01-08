class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	has_many :created_events, :foreign_key => :creator_id, :class_name => "Event"
	has_many :event_attendances, :foreign_key => :attendee_id
	has_many :attended_events, :through => :event_attendances
	
	def upcoming_events_attending
		self.attended_events.upcoming
	end

	def previously_attended_events
		self.attended_events.past
	end

	def upcoming_created_events
		self.created_events.upcoming
	end

	def past_created_events
		self.created_events.past
	end
end
