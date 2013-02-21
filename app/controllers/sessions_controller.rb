class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],params[:session][:password])
    if user.nil?
      flash.now[:alert] = "Invalid email/password pair"
      @title = 'Error'
      render 'new'
    else
      sign_in user
      flash[:notice] = "Sign in success!"
      redirect_to current_user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
