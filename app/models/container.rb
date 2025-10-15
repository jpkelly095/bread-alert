class Container < ApplicationRecord
  has_rich_text :notes
  has_many :recipes

  validates :name, :weight, presence: true
  validates :weight, numericality: { greater_than: 0 }

  before_destroy :ensure_not_referenced_by_any_recipe

  private

  def ensure_not_referenced_by_any_recipe
    if recipes.exists?
      errors.add(:base, "Cannot delete #{name} because it is currently in use by these recipes: #{recipes.pluck(:name).join(", ")}")
      throw :abort
    end
  end
end
