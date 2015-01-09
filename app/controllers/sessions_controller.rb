class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email].downcase)
  	if @user
  		log_in @user
  		redirect_back_or @user
  	else
  		flash.now[:danger] = "User does not exist"
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  end
end
