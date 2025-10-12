class CreateFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :serving_size, null: false
      t.integer :carbs_per_serving, null: false
      t.text :notes

      t.timestamps
    end
  end
end
