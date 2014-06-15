class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.boolean :buyShow
      t.boolean :is_conver
      t.references :album, index: true
      t.integer :status

      t.timestamps
    end
  end
end
