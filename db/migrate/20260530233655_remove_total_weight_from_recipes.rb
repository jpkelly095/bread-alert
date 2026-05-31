class RemoveTotalWeightFromRecipes < ActiveRecord::Migration[8.1]
  def change
    remove_column :recipes, :total_weight, :integer
  end
end
