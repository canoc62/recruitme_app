class RemoveYearColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :year
  end
end
