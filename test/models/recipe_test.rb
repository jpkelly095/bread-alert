require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "bagels carbs per serving" do
    assert_equal 813, recipes(:bagels).carbs_per_serving
  end

  test "bagels carbs for" do
    assert_equal 46, recipes(:bagels).carbs_for(90) # should round to 46
  end
end
