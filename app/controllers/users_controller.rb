class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #better than .all because less load on server (also sql joins is better option)
    @users = User.includes(:profile)
  end
  
  # GET /users/:id
  def show
    @user = User.find( params[:id] )
    
  end
end