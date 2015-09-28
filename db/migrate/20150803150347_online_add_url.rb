class OnlineAddUrl < ActiveRecord::Migration
  def change
  	 add_column :onlines, :price, :integer
  	 add_column :onlines, :zip_conver_url, :string
  	 add_column :onlines, :video_url, :string
  	 add_column :onlines, :type, :integer
  	 add_column :onlines, :order_num, :integer
	 add_column :onlines, :upyun_noti, :integer
  end
end
