class AddFieldGoalAttemptsToGameStats < ActiveRecord::Migration
  def change
  	add_column :game_stats, :field_goal_attempts, :integer
  end
end
