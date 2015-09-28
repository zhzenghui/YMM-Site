class CreateShareLists < ActiveRecord::Migration
  def change
    create_table :share_lists do |t|
      t.string :user_name , :default => ""
      t.integer :objct_id , :default => 0
      t.integer :objct_type , :default => 0
      t.integer :is_zengsong_xingyunbi , :default =>  0

      t.timestamps
    end
  end
end
