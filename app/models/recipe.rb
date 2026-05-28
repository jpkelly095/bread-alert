class Recipe < ApplicationRecord
  has_rich_text :notes
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients
  belongs_to :container, optional: true

  validates :name, :total_weight, presence: true
  validates :total_weight, numericality: { greater_than: 0 }

  validate :weight_must_be_positive

  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

  def total_carbs
    ingredients.sum do |ingredient|
      ingredient.food.carbs_for(ingredient.quantity)
    end
  end

  def carbs_for(amount)
    (amount.fdiv(weight) * total_carbs).round
  end

  private

  def weight
    container.nil? ? total_weight : total_weight - container.weight
  end

  def weight_must_be_positive
    if container.present? && container.weight >= total_weight
      errors.add(:total_weight, "must be greater than the container weight")
    end
  end
end
