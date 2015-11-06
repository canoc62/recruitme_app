class CreateGameStats < ActiveRecord::Migration
  def change
    create_table :game_stats do |t|
      t.string :opponent
    	t.integer :pass_attempts
      t.integer :pass_yards
      t.integer :pass_tds
      t.integer :rush_attempts
      t.integer :rush_yards 
      t.integer :rush_tds
      t.integer :receptions
      t.integer :receiving_yds
      t.integer :receiving_tds
      t.integer :tackles
      t.integer :sacks
      t.integer :interceptions
      t.integer :field_goals_attempts
      t.integer :field_goals_made
      t.integer :pat_attempts
      t.integer :pat_made
      t.timestamps
    end
  end
end
