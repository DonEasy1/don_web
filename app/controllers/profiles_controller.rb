class ProfilesController < ApplicationController
  # GET to /users/:user_id/profile/new
  def new
    @profile = Profile.new
  end
  
   # POST to /users/:user_id/profile
  def create
    # Ensure that we have the user who is filling out form
    @user = User.find(params[:user_id])
    # Create profile link to this specific user.
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile updated!"
      redirect_to user_path(id: params[:user_id] )
    else
      render action: :new
    end
  end
  
  # GET /users/:user_id/profile/edit
  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end
  
  private
  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :current_member_union, :role, :phone_number, :contact_email, :description)
  end
end