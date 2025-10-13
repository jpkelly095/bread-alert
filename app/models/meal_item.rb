class MealItem < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :meal

  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def total_carbs
    item.carbs_for(quantity)
  end
end
