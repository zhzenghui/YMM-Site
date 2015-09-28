class OnlineAddReferencesUser < ActiveRecord::Migration
  def change
  	 add_column :onlines, :user_id, :integer
  end
end
