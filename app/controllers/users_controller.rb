class UsersController < ApplicationController
  def new
    @title =  "Sign up"
    @user = User.new
  end

  # extract data in sign_up form to @user
  # if user is valid, sign_in and get his profile
  # else comes an error message
  def create
    @user = User.new params[:user]
    if @user.save
      sign_in @user
      redirect_to current_user
    else
      @title = "Error"
      flash.now[:alert] = "Invalid user"
      render 'new'
    end
  end

  def show
    @title = "Profile"
  end
end
