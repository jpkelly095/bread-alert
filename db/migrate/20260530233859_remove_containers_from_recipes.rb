class RemoveContainersFromRecipes < ActiveRecord::Migration[8.1]
  def change
    remove_reference :recipes, :container, index: true
  end
end
