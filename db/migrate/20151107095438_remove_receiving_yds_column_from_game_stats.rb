class RemoveReceivingYdsColumnFromGameStats < ActiveRecord::Migration
  def change
  	remove_column :game_stats, :receiving_yds
  end
end
