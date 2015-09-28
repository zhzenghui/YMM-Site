class CreateRecharges < ActiveRecord::Migration
  def change
    create_table :recharges do |t|
      t.integer :user_id
      t.integer :type
      t.integer :type_price
      t.integer :success
      t.text :pingju_content
      t.integer :apple_validate
      t.integer :people_validate
      t.integer :revalidate

      t.timestamps
    end
  end
end
