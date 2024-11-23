class CreateAttributesCurvedBarbells < ActiveRecord::Migration[8.0]
  def change
    create_table :attributes_curved_barbells do |t|
      t.float :gauge
      t.float :length

      t.timestamps
    end
  end
end
