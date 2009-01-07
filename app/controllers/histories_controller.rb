class HistoriesController < ApplicationController
  before_filter :login_required
  
  def add
    @goal = current_user.goals.find(params[:id])
    unless request.post?
      @history = @goal.histories.new :history_at => Time.now.strftime("%m/%d/%Y"), :style => 2
      return render :layout => false
    end
    @history = History.new params[:history]
    @history.before_number = @goal.current
    if params[:history][:style] == "1"
      @goal.current = params[:history][:number]
    else
      @goal.current += params[:history][:number].to_f
    end
    @history.after_number = @goal.current
    @goal.histories << @history
    @goal.save
    return render :layout => false, :text => "history added."
  end
end
