class SchoolYear < ActiveRecord::Base
	#belongs_to :user
	has_many :users
	#has_many :game_stats
end