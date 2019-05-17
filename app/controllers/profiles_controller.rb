class ProfilesController < ApplicationController
  
  # GET to /users/:user_id/profile/new(
  def new
    @profile = Profile.new
    # @plan = User.find(current_user.id).plan_id (<=experimenting here)
    # render blank profile details form, so can enter info and save and then create, which means can make corresponding view file)
  end
end
