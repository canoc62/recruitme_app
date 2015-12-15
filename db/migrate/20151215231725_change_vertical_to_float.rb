class ChangeVerticalToFloat < ActiveRecord::Migration
  def change
    change_column :users, :vertical, :float
  end
end
