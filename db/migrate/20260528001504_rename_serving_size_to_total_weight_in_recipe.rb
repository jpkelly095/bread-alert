class RenameServingSizeToTotalWeightInRecipe < ActiveRecord::Migration[8.1]
  def change
    rename_column :recipes, :serving_size, :total_weight
  end
end
