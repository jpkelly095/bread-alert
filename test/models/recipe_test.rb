require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "bagels total carbs" do
    bagels = recipes(:bagels)
    assert_equal 813, bagels.total_carbs

    # total_carbs should change when sugar is deleted
    sugar = ingredients(:bagels_sugar)
    bagels.ingredients.delete(sugar)
    assert_equal 767, bagels.total_carbs
  end
end
