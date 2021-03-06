class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
  	unless logged_in?
  		store_forwarding_url
  		flash[:danger] = "Please log in first."
  		redirect_to login_path
  	end
  end
end
