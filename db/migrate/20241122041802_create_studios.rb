class CreateStudios < ActiveRecord::Migration[8.0]
  def change
    create_table :studios do |t|
      t.string :name
      t.text :address
      t.string :website_url
      t.string :phone

      t.timestamps
    end
  end
end
