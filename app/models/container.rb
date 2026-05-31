class Container < ApplicationRecord
  has_rich_text :notes
  has_many :bakes

  validates :name, :weight, presence: true
  validates :weight, numericality: { greater_than: 0 }

  before_destroy :ensure_not_referenced_by_any_bake

  private

  def ensure_not_referenced_by_any_bake
    if bakes.exists?
      errors.add(:base, "Cannot delete #{name} because it is currently in use by these bakes: #{bakes.pluck(:id).join(", ")}")
      throw :abort
    end
  end
end
