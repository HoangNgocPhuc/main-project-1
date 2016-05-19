require 'test_helper'

class HealthTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @health = @user.healths.build(height: "170", weight: "60", bmi: 2.36)
  end

  test "should be valid" do
    assert @health.valid?
  end

  test "user id should be present" do
    @health.user_id = nil
    assert_not @health.valid?
  end
  
  test "weight should be present" do
    @health.weight = "   "
    assert_not @health.valid?
  end
  
  test "height should be present" do
    @health.height = "   "
    assert_not @health.valid?
  end

  test "weight should be a numeric" do
    @health.weight = "abc"
    @health.weight.to_f.is_a? Numeric
    assert_not @health.valid?
  end
  
  test "height should be a numeric" do
    @health.height = "abc"
    @health.height.to_f.is_a? Numeric
    assert_not @health.valid?
  end
  
  test "weight should be at most 3 characters" do
    @health.weight = "9" * 4
    assert_not @health.valid?
  end
  
  test "height should be at most 3 characters" do
    @health.height = "9" * 4
    assert_not @health.valid?
  end
  
  test "order should be most recent first" do
    assert_equal healths(:most_recent), Health.first
  end
end
