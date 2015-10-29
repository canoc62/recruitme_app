class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :age
    	t.string :height
    	t.string :weight
    	t.string :city
    	t.string :state
    	t.string :school
    	t.string :year
    	t.string :position
    	t.timestamps
    end
  end
end

