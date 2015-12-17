class AddBroadJumpToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :broad_jump, :float
  end
end
