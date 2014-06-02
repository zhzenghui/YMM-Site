class CreateInAppTypes < ActiveRecord::Migration
  def change
    create_table :in_app_types do |t|
      t.string :display_name
      t.string :in_app_type
      t.text :description
      t.string :apple_id
      t.string :apple_bundle_id
      t.string :apple_type
      t.decimal :price

      t.timestamps
    end
  end
end
