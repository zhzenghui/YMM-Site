class AddConverColumnToAblums < ActiveRecord::Migration
  def change
  	add_attachment :ablums, :avatar
  end
  
end
