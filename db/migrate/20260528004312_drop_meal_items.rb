class DropMealItems < ActiveRecord::Migration[8.1]
  def change
    drop_table :meal_items
  end
end
