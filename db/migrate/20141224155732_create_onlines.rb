class CreateOnlines < ActiveRecord::Migration
  def change
    create_table :onlines do |t|
      t.string :title
      t.string :cover_url
      t.text :description
      t.string :relation_url
      t.text :user
      t.integer :user_count
      t.integer :image_count
      t.integer :zan_count
      t.datetime :end_day
      t.text :zan_user
      t.integer :free
      t.text :essence
      t.integer :state, :null => false, :default => 1

      t.timestamps
    end
  end
end
