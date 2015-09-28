class CreateUserJinbis < ActiveRecord::Migration
  def change
    create_table :user_jinbis do |t|
      t.integer :jinbi , :default => 0 
      t.integer :ruanmeibi, :default => 0 
      t.integer :xingyunbi, :default => 0 

      t.timestamps
    end
  end
end
