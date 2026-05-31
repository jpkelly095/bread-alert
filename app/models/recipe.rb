class Recipe < ApplicationRecord
  has_rich_text :notes
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients
  has_many :bakes, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :bakes, allow_destroy: true, reject_if: :all_blank

  def total_carbs
    ingredients.sum do |ingredient|
      ingredient.food.carbs_for(ingredient.quantity)
    end
  end
end
