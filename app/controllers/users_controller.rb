class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Thank you for signing up!  Welcome to Private Events!"
  		log_in @user
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  	@created_events = @user.created_events
  	@attended_events = @user.attended_events
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email)
  	end
end
