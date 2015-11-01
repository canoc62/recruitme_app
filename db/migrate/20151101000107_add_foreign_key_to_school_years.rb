class AddForeignKeyToSchoolYears < ActiveRecord::Migration
  def change
  	add_column :school_years, :user_id, :integer
  end
end
