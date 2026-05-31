class Bake < ApplicationRecord
  before_create :set_total_carbs

  belongs_to :recipe
  belongs_to :container, optional: true

  validates :total_weight, :baked_on, presence: true
  validates :total_weight, numericality: { greater_than: 0 }

  validate :weight_must_be_positive

  def carbs_for(amount)
    (amount.fdiv(weight) * total_carbs).round
  end

  private

  def set_total_carbs
    self.total_carbs = recipe.total_carbs
  end

  def weight
    container.nil? ? total_weight : total_weight - container.weight
  end

  def weight_must_be_positive
    if container.present? && container.weight >= total_weight
      errors.add(:total_weight, "must be greater than the container weight")
    end
  end
end
