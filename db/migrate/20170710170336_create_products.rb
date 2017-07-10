class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :size
      t.integer :speed
      t.text :description

      t.timestamps
    end
  end
end
