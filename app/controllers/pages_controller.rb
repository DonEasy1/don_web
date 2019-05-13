class PagesController < ApplicationController
  def home
  end
  
  def about
  end

  def blog
  end
  
  # GET request for connection page
  def connect
    @basic_plan = Plan.find(1)
    @pro_plan =Plan.find(2)
  end
  
  def consult
  end
  
  def contract
  end
end

        