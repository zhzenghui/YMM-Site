class AddUserSettingInfo < ActiveRecord::Migration
  def change
  	  add_column :users, :user_type, :string # 账户的类型
   	  add_column :users, :pulish_type, :string #公开类型 
	  add_column :users, :sender_type, :integer # 接收信息的类型
  	  add_column :users, :sender_id, :string # 接收信息的 id
  	  add_column :users, :balance, :string # 账户的余额
    
  end
end
