class CreateOnlineDetails < ActiveRecord::Migration
  def change
    create_table :online_details do |t|
      t.string :media_url
      t.text :frames
      t.text :description
      t.integer :state
      t.integer :free
      t.text :priview
      t.integer :auth
      t.text :auth
      t.integer :zan_count
      t.integer :share_count
      t.references :online

      t.timestamps
    end
  end
end
