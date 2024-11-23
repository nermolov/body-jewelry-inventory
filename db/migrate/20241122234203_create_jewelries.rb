class CreateJewelries < ActiveRecord::Migration[8.0]
  def change
    create_table :jewelries do |t|
      t.string :name
      t.references :brand, null: false, foreign_key: true
      t.references :studio, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.references :jewelry_attributes, polymorphic: true, null: false

      t.timestamps
    end
  end
end
