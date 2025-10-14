class AddContainerRefToRecipe < ActiveRecord::Migration[8.0]
  def change
    add_reference :recipes, :container, null: true
  end
end
