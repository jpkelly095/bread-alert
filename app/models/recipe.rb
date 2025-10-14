class Recipe < ApplicationRecord
  has_rich_text :notes
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients
  belongs_to :container, optional: true

  validates :name, :serving_size, presence: true
  validates :serving_size, numericality: { greater_than: 0 }

  validate :weight_must_be_positive

  def carbs_per_serving
    ingredients.sum do |ingredient|
      ingredient.food.carbs_for(ingredient.quantity)
    end
  end

  def carbs_for(amount)
    (amount.fdiv(weight) * carbs_per_serving).round
  end

  private

  def weight
    container.nil? ? serving_size : serving_size - container.weight
  end

  def weight_must_be_positive
    if container.present? && container.weight >= serving_size
      errors.add(:serving_size, "must be greater than the container weight")
    end
  end
end
