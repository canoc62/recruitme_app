class RemoveFieldGoalsAttemptsColumnFromGameStats < ActiveRecord::Migration
  def change
  	remove_column :game_stats, :field_goals_attempts
  end
end
