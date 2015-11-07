class AddPassIntToGameStats < ActiveRecord::Migration
  def change
  	add_column :game_stats, :pass_int, :integer
  end
end
