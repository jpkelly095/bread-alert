class MealItem < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :meal
end
