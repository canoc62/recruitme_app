class FixSchoolYearsColumnName < ActiveRecord::Migration
  def change
  	rename_column :school_years, :school_year, :year 
  end
end
