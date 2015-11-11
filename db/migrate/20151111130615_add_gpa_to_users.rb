class AddGpaToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :gpa, :float
  end
end
