class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender
      t.integer :receive
      t.string :last_msg
      t.integer :status
      t.integer :type
      t.integer :isDel

      t.timestamps
    end
  end
end
