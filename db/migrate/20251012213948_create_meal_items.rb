class CreateMealItems < ActiveRecord::Migration[8.0]
  def change
    create_table :meal_items do |t|
      t.references :item, polymorphic: true, null: false
      t.references :meal, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
