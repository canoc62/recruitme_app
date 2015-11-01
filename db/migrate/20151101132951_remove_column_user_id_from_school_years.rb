class RemoveColumnUserIdFromSchoolYears < ActiveRecord::Migration
  def change
    remove_column :school_years, :user_id, :boolean
  end
end
