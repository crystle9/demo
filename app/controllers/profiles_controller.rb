class ProfilesController < ApplicationController

  before_filter :authenticate
    

  def edit
    @profile = Profile.find_by_user_id(params[:id])
  end

   def update
     @user = User.find_by_id params[:id]
     @user.profile.update_attributes params[:profile]
     redirect_to @user
   end

  private

    # for page protection
    def authenticate
      deny_access unless signed_in? params[:id]
    end
end
