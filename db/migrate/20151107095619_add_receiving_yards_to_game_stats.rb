class AddReceivingYardsToGameStats < ActiveRecord::Migration
  def change
  	add_column :game_stats, :receiving_yards, :integer
  end
end
