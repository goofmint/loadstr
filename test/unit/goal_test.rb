require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  fixtures :users, :goals
  
  def test_should_create_user
    user = User.find(2)
    assert_difference 'Goal.count', +3, "#{user.errors.full_messages.to_sentence}" do
      user.goals << create_goals
      user.save
    end
  end
  
  def test_goals_must_three
    user = User.find(2)
    user.goals << create_goals.slice(0, 2)
    user.save
    assert user.errors.on(:base)
  end
  
  def test_validate_require_message
    user = User.find(2)
    user.goals << create_goals.slice(0, 2)
    user.goals << Goal.new(:message => "", :number => 0, :message2 => "message", :current => 1)
    user.save
    assert user.goals[2].errors.on(:message)
  end

  def test_validate_require_message2
    user = User.find(2)
    user.goals << create_goals.slice(0, 2)
    user.goals << Goal.new(:message => "message", :number => 0, :message2 => "", :current => 1)
    user.save
    assert user.goals[2].errors.on(:message2)
  end

  def test_validate_require_number
    user = User.find(2)
    user.goals << create_goals.slice(0, 2)
    user.goals << Goal.new(:message => "message", :number => "", :message2 => "message2", :current => 1)
    user.save
    assert user.goals[2].errors.on(:number)
  end
  
  def test_validate_require_current
    user = User.find(2)
    user.goals << create_goals.slice(0, 2)
    user.goals << Goal.new(:message => "message", :number => 100, :message2 => "message2", :current => "")
    user.save
    assert user.goals[2].errors.on(:current)
  end
  
  def create_goals
    [
     {:message => "get pay", :number  => 10000000, :message2 => "yen", :current => 0},
     {:message => "diet", :number  => 55, :message2 => "kg", :current => 10},
     {:message => "write", :number  => 500, :message2 => "articles on my blog", :current => 20},
    ].collect {|g|
      Goal.new g
    }
  end
end
