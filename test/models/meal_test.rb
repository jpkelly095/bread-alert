require "test_helper"

class MealTest < ActiveSupport::TestCase
  test "total carbs for breakfast" do
    breakfast = meals(:breakfast)
    assert_equal 60, breakfast.total_carbs

    apple = meal_items(:apple)
    breakfast.meal_items.delete(apple)
    assert_equal 46, breakfast.total_carbs # should change when apple is removed
  end
end
