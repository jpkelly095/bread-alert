class DropMeals < ActiveRecord::Migration[8.1]
  def change
    drop_table :meals
  end
end
