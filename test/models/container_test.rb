require "test_helper"

class ContainerTest < ActiveSupport::TestCase
  test "does not delete if associated with recipes" do
    pie_dish = containers(:pie_dish)
    apple_pie = recipes(:apple_pie)
    apple_pie.update!(container: pie_dish)

    result = pie_dish.destroy

    assert_not result, "Container should not be destroyed if associated with recipes"
    assert_includes pie_dish.errors.full_messages.first, "currently in use"
    assert_not_nil Container.find_by(id: pie_dish.id)
  end
end
