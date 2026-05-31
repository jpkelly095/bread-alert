require "test_helper"

class BakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bake = bakes(:bagels)
  end

  test "should get index" do
    get bakes_url
    assert_response :success
  end

  test "should get new" do
    get new_bake_url
    assert_response :success
  end

  test "should create bake" do
    assert_difference("Bake.count") do
      post bakes_url, params: { bake: { container_id: @bake.container_id, recipe_id: @bake.recipe_id, total_carbs: @bake.total_carbs, total_weight: @bake.total_weight, baked_on: 1.week.ago } }
    end

    assert_redirected_to bake_url(Bake.last)
  end

  test "should show bake" do
    get bake_url(@bake)
    assert_response :success
  end

  test "should get edit" do
    get edit_bake_url(@bake)
    assert_response :success
  end

  test "should update bake" do
    patch bake_url(@bake), params: { bake: { containers_id: @bake.container_id, recipes_id: @bake.recipe_id, total_carbs: @bake.total_carbs, total_weight: @bake.total_weight } }
    assert_redirected_to bake_url(@bake)
  end

  test "should destroy bake" do
    assert_difference("Bake.count", -1) do
      delete bake_url(@bake)
    end

    assert_redirected_to bakes_url
  end
end
