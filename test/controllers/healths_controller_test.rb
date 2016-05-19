require 'test_helper'

class HealthsControllerTest < ActionController::TestCase
  def setup
    @health = healths(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Health.count' do
      post :create, health: { height: "170", weight: "60", bmi: 2.36 }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Health.count' do
      delete :destroy, id: @health
    end
    assert_redirected_to login_url
  end
end
