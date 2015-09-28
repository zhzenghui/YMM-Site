class CreateIpaProducts < ActiveRecord::Migration
  def change
    create_table :ipa_products do |t|
      t.string :name, :default => ""
      t.integer :jine, :default => 0 
      t.integer :jinbi, :default => 0 
      t.string :bid , :default => ""

      t.timestamps
    end
  end
end
