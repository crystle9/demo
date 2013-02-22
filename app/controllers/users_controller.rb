
class UsersController < ApplicationController

  # for page protection
  before_filter :authenticate, :only => [:show]
  before_filter :admin_authenticate, :only => [:index]

  def index
    @title = "Admin"
    @users = User.all
  end

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
      @user.profile = Profile.create
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
    @user = User.find_by_id(params[:id])
  end

  private

    # for page protection
    def authenticate
      deny_access unless signed_in? params[:id]
    end

    def admin_authenticate
      deny_access unless signed_in? User.admin_id
    end
end
