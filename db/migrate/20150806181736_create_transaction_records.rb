class CreateTransactionRecords < ActiveRecord::Migration
  def change
    create_table :transaction_records do |t|
      t.integer :expend_user_id
      t.integer :income_user_id
      t.integer :goods_id
      t.integer :goods_info
      t.integer :transaction_type
      t.integer :recharge_id
      t.integer :price
      t.integer :expend
      t.integer :income

      t.timestamps
    end
  end
end
