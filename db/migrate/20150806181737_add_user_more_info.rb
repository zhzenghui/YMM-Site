class AddUserMoreInfo < ActiveRecord::Migration

  def change

  	add_column :users, :jinbi, :integer, :default => 0
	add_column :users, :rmb, :integer , :default => 0
	add_column :users, :apple_token, :string, :default => ""

	add_column :users, :fans, :integer, :default => 0
	add_column :users, :follow, :integer, :default => 0
	add_column :users, :like, :integer, :default => 0

	add_column :users, :allow_push_message, :integer, :default => 1  # 1 允许 2 不允许
	# 订阅
	# 付费订阅
	add_column :users, :rss_num, :integer , :default => 0 # 1 允许 2 不允许

	add_column :users, :version, :string, :default => ""  #  程序版本信息
	add_column :users, :device, :string , :default => "" #  设备信息

	add_column :users, :longitude, :decimal , :default => 0 # 警告 可能出错的地方
	add_column :users, :latitude, :decimal  , :default => 0 # 警告 可能出错的地方
	add_column :users, 	:sex, :integer , :default => 1 # 1 男 2 女
	add_column :users, 			:city_id, :integer , :default => 1 # 
	add_column :users, 			:city, :string , :default => 1 # 
	add_column :users, 			:p_id, :string , :default => "" # 

	add_column :onlines, 		:more_details, :text, :default => "" # 
	add_column :onlines, 		:p_id, :string , :default => "" # 
	add_column :online_details, :p_id, :string , :default => "" # 
	add_column :messages, 		:p_id, :string , :default => "" # 
	add_column :message_details,:p_id, :string , :default => "" # 

  end
end
