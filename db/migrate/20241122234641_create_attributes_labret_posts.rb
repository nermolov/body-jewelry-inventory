class CreateAttributesLabretPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :attributes_labret_posts do |t|
      t.float :gauge
      t.float :length

      t.timestamps
    end
  end
end
