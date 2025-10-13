class Ingredient < ApplicationRecord
  belongs_to :food
  belongs_to :recipe, touch: true

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
