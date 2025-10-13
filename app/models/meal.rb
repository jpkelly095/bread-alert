class Meal < ApplicationRecord
  has_many :meal_items, dependent: :destroy

  def total_carbs
    meal_items.sum(&:total_carbs)
  end
end
