class AddGameStatYearToGameStats < ActiveRecord::Migration
  def change
  	add_column :game_stats, :game_stat_year, :string
  end
end
