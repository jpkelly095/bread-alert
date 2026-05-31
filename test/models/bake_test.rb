require "test_helper"

class BakeTest < ActiveSupport::TestCase
  test "bagels carbs_for" do
    bagels = bakes(:bagels)
    assert_equal 46, bagels.carbs_for(90) # should round to 46
  end

  test "apple pie carbs_for without container" do
    apple_pie = bakes(:apple_pie)

    assert_equal 27, apple_pie.carbs_for(90)
  end

  test "apple pie carbs_for with container" do
    apple_pie = bakes(:apple_pie)
    apple_pie.container = containers(:pie_dish)

    assert_equal 52, apple_pie.carbs_for(90)
  end
end
