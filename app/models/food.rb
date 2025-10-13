class Food < ApplicationRecord
  has_rich_text :notes

  validates :name, :carbs_per_serving, :serving_size, presence: true
  validates :carbs_per_serving, :serving_size, numericality: { greater_than: 0 }

  def carbs_for(amount)
    (amount.fdiv(serving_size) * carbs_per_serving).round
  end
end
