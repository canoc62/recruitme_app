class AddPassCompletionsToGameStats < ActiveRecord::Migration
  def change
  	add_column :game_stats, :pass_completions, :integer
  end
end
