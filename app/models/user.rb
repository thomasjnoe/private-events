class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	has_many :created_events, :foreign_key => :creator_id, :class_name => "Event"
end
