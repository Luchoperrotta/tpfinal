class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.integer :quota
      t.integer :interest
      t.boolean :active
      t.boolean :onsale
      t.integer :stock
      t.integer :discountPercentage
      t.references :bank, null: false, foreign_key: true
      t.references :delivery, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
