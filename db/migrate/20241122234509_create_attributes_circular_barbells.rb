class CreateAttributesCircularBarbells < ActiveRecord::Migration[8.0]
  def change
    create_table :attributes_circular_barbells do |t|
      t.float :gauge
      t.float :diameter

      t.timestamps
    end
  end
end
