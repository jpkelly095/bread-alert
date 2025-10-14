class CreateContainers < ActiveRecord::Migration[8.0]
  def change
    create_table :containers do |t|
      t.string :name, null: false
      t.integer :weight, null: false
      t.text :notes

      t.timestamps
    end
  end
end
