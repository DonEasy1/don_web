class Users::RegistrationsController < Devise::RegistrationsController
  before_action :select_plan, only: :new
  # Extend default Devise gem behavior so
  # users signing up with Pro (plan ID 2)
  # save with a special Stripe subscription fxn
  # Otherwise, Devise signs up user as usual.
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
  
  private
    def select_plan
      unless (params[:plan] == '1' || params[:plan] == '2')
      flash[:notice] = "Please sign up for one of the membership connect plans."
      redirect_to connect_path(params[:user_id])
        # return
      end
    end
end