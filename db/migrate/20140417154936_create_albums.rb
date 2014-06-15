class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.text :text
      t.integer :publish
      t.boolean :free
      t.references :user, index: true
      t.string :url

      t.timestamps
    end
  end
end
