class CreateAttributesChains < ActiveRecord::Migration[8.0]
  def change
    create_table :attributes_chains do |t|
      t.float :length

      t.timestamps
    end
  end
end
