class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.string :user_name
      t.integer :product_id 
      t.integer :product_price 
      t.integer :type, :default => 0 
      t.integer :iap_list_id 
      t.integer :pay_status , :default => 0 
      t.integer :gathering_status , :default => 0 

      t.timestamps

    end
  end
end
