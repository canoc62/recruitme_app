class DropSchoolYears < ActiveRecord::Migration
  def change
    drop_table :school_years
  end
end
