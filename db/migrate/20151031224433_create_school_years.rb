class CreateSchoolYears < ActiveRecord::Migration
  def change
    create_table :school_years do |t|
    	t.string :school_year
      t.timestamps
    end
  end
end
