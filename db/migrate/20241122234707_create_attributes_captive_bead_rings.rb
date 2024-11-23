class CreateAttributesCaptiveBeadRings < ActiveRecord::Migration[8.0]
  def change
    create_table :attributes_captive_bead_rings do |t|
      t.float :gauge
      t.float :ring_diameter
      t.float :bead_diameter

      t.timestamps
    end
  end
end
