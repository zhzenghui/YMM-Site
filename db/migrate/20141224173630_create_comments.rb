class CreateComments < ActiveRecord::Migration
  def change

  	drop_table :comments
    create_table :comments do |t|
      t.text :content
      t.references :user, index: true
      t.integer :zan_count
      t.references :online_detail

      t.timestamps
    end
  end
end
