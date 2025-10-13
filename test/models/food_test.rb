require "test_helper"

class FoodTest < ActiveSupport::TestCase
  test "carbs for sugar" do
    sugar = foods(:sugar) # 1 carb per gram
    res = sugar.carbs_for(50)
    assert_equal 50, res
  end

  test "carbs for flour" do
    flour = foods(:flour) # 23 carbs per 30 grams
    res = flour.carbs_for(60)
    assert_equal 46, res
  end
end
