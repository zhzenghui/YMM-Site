class CreateMessageDetails < ActiveRecord::Migration
  def change
    create_table :message_details do |t|
      t.integer :message_id
      t.string :title
      t.text :content
      t.integer :sender_status
      t.integer :receive_status
      t.integer :isDel

      t.timestamps
    end
  end
end
