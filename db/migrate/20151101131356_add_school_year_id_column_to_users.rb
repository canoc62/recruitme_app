class AddSchoolYearIdColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :school_year_id, :integer
  end
end
