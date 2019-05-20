class ProfilesController < ApplicationController
  
  # GET to /users/:user_id/profile/new(
  def new
    # @plan = User.find(current_user.id).plan_id (<=experimenting here)
    # render blank profile details form, so can enter info and save and then create, which means can make corresponding view file)
    @profile = Profile.new
  end
  
  #POST to /users/:id_id/profile
  def create
    # Ensure we have user who is filling out form
    @user = User.find( params[:user_id] )
    # Create profile linked to this specific user.
    @profile = @user.build_profile( profile_params )
    if @profile.save
      flash[:success] = "Profile saved!"
      redirect_to root_path
    else
      render action: :new
    end
  end
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :current_member_union, :job_title, :role, :phone_number, :contact_email, :description )
    end
end
