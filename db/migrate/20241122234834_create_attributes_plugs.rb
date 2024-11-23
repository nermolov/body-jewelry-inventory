class CreateAttributesPlugs < ActiveRecord::Migration[8.0]
  def change
    create_table :attributes_plugs do |t|
      t.float :gauge
      t.float :length
      t.boolean :double_flared

      t.timestamps
    end
  end
end
