class OnlineDetailAddReferencesUser < ActiveRecord::Migration
  def change
    add_column :online_details, :user_id, :integer
    add_column :online_details, :user, :text
  end
end
