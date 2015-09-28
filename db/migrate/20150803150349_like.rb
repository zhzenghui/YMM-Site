
class Like < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :object_id
      t.integer :type
      t.integer :state,  :default => 1

      t.timestamps
    end
  end
end
