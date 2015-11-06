class RemoveForeignKeyFromSchoolYears < ActiveRecord::Migration
  def change
    remove_foreign_key :school_years, name: :user_id
  end
end
