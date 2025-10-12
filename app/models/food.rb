class Food < ApplicationRecord
  has_rich_text :notes

  def carbs_for(amount)
    (amount.fdiv(serving_size) * carbs_per_serving).round
  end
end
