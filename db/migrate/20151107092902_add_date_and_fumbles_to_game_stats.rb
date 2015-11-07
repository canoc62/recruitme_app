class AddDateAndFumblesToGameStats < ActiveRecord::Migration
  def change
  	add_column :game_stats, :date, :date
  	add_column :game_stats, :fumbles, :integer
  	add_column :game_stats, :fumbles_lost, :integer
  end
end
