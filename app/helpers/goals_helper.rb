module GoalsHelper
  def goal_text(goal)
    "I'll #{goal.message} #{number_with_delimiter(goal.number)} #{goal.message2} in 2009. Currently #{goal.current}"
  end
end
