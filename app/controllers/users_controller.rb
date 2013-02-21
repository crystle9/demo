class UsersController < ApplicationController
  def new
    @title =  "Sign up"
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      sign_in @user
      redirect_to @user
    else
      @title = "Error"
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @title = @user.name
  end
end
