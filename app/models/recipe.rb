class Recipe < ApplicationRecord
  has_rich_text :notes
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients

  validates :name, :serving_size, presence: true
  validates :serving_size, numericality: { greater_than: 0 }

  def carbs_per_serving
    ingredients.sum do |ingredient|
      ingredient.food.carbs_for(ingredient.quantity)
    end
  end

  def carbs_for(amount)
    (amount.fdiv(serving_size) * carbs_per_serving).round
  end
end
