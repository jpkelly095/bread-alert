require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "bagels carbs per serving" do
    bagels = recipes(:bagels)
    assert_equal 813, bagels.carbs_per_serving

    # carbs_per_serving should change when sugar is deleted
    sugar = ingredients(:bagels_sugar)
    bagels.ingredients.delete(sugar)
    assert_equal 767, bagels.carbs_per_serving
  end

  test "bagels carbs for" do
    bagels = recipes(:bagels)
    assert_equal 46, bagels.carbs_for(90) # should round to 46

    # carbs_for should change when sugar is deleted
    sugar = ingredients(:bagels_sugar)
    bagels.ingredients.delete(sugar)
    assert_equal 43, bagels.carbs_for(90)
  end
end
