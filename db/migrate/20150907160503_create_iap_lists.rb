class CreateIapLists < ActiveRecord::Migration
  def change
    create_table :iap_lists do |t|
      t.integer :user_id, :default => 0 
      t.string :user_name , :default => "" 
      t.integer :type         , :default => 0 
      t.integer :is_apple_valid , :default => 0 
      t.integer :is_people_valid, :default => 0 
      t.integer :re_valid , :default => 0 
      t.text :receipt_data , :default => ""
      t.string :receipt_md5, :default => ""
      t.integer :status , :default => 0 

      t.timestamps


    end
  end
end
