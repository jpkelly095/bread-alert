class CreateBakes < ActiveRecord::Migration[8.1]
  def change
    create_table :bakes do |t|
      t.integer :total_carbs
      t.integer :total_weight
      t.date :baked_on
      t.references :recipe, null: false, foreign_key: true
      t.references :container, foreign_key: true

      t.timestamps
    end
  end
end
