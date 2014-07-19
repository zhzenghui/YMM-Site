class CreateAComments < ActiveRecord::Migration
  def change
    create_table :a_comments do |t|
      t.string :content
      t.integer :status
      t.references :album, index: true

      t.timestamps
    end
  end
end
