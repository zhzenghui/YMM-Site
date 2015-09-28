class CreateTongjis < ActiveRecord::Migration
  def change
    create_table :tongjis do |t|
      t.integer :all_jinbi , :default => 0 
      t.integer :all_ruanmeibi, :default => 0 
      t.integer :luckbi, :default => 0 
      t.integer :all_iap_count, :default => 0 

      t.timestamps
    end
  end
end
