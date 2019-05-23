class ProfilesController < ApplicationController
  # Protect profile pages. Devise handles first before action
  before_action :authenticate_user!
  # this user variable defined in private section below.
  before_action :only_current_user!
  
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
      redirect_to user_path(id: params[:user_id])
    else
      render action: :new
    end
  end
  
  # GET /users/:user_id/profile/edit
  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end
  
  # PUT /users/:user_id/profile
  def update
    # Retrieve user from database
    @user = User.find(params[:user_id])
    # Retrieve that user's profile
    @profile = @user.profile
    # Mass assign edited profile attributes and save update
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated!"
      # Redirect user to their profile page
      redirect_to user_path(id: params[:user_id] )
    else
      render action: :edit
    end
  end
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :current_member_union, :role, :phone_number, :contact_email, :description)
    end
    
    def only_current_user!
      @user = User.find(params[:user_id])
      #unless user id in url matches devise check for current user, redirect to root
      redirect_to connect_path unless @user == current_user
    end
end