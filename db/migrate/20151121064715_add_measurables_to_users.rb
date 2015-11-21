class AddMeasurablesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :forty, :float
  	add_column :users, :bench_press, :integer
  	add_column :users, :squat, :integer
  	add_column :users, :vertical, :integer
  	add_column :users, :shuttle, :float
  	add_column :users, :three_cone, :float
  	add_column :users, :SAT, :integer
  	add_column :users, :ACT, :integer
  end
end
