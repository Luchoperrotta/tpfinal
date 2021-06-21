class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :point, null: false, foreign_key: true
      t.references :profit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
