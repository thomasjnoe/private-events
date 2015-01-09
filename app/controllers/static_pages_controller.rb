class StaticPagesController < ApplicationController
  def home
  	@upcoming_events = Event.upcoming[0..2]
  	@past_events = Event.past[0..2]
  end

  def about
  end
end
