require "test_helper"

class MealTest < ActiveSupport::TestCase
  test "total carbs for breakfast" do
    assert_equal 60, meals(:breakfast).total_carbs
  end
end
