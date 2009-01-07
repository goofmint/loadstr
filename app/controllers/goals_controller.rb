class GoalsController < ApplicationController
  before_filter :login_required, :except => [:show]
  def index
    
  end
  
  def show
    @user = User.find params[:id]
  end
  
  def new
    return redirect_to(:action => :index) unless current_user.goals.size == 0
    return render unless request.post?
    params[:goals].each{|k, goal|
      current_user.goals << Goal.new(goal)
    }
    if current_user.save
      return redirect_to("/")
    end
  end
  
  def edit
    return render unless request.post?
  end
end
