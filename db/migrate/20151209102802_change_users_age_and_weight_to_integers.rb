class ChangeUsersAgeAndWeightToIntegers < ActiveRecord::Migration
  def change
  	change_column :users, :age, :integer
    change_column :users, :weight, :float
  end
end
