class AddUserIdToGameStats < ActiveRecord::Migration
  def change
  	add_column :game_stats, :user_id, :integer
  end
end
