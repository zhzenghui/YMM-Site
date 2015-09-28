
class OnlineDetailAddUrl < ActiveRecord::Migration
  def change
  	 add_column :online_details, :price, :integer
  	 add_column :online_details, :zip_conver_url, :string
  	 add_column :online_details, :video_url, :string
  	 add_column :online_details, :type, :integer
  	 add_column :online_details, :order_num, :integer
  	 add_column :online_details, :upyun_noti, :integer

  end
end
