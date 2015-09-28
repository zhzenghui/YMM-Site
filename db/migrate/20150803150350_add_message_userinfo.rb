class AddMessageUserinfo < ActiveRecord::Migration
  def change
  	 add_column :messages, :sender_userinfo, :string
  	 add_column :message_details, :sender_userinfo, :string
  end
end
