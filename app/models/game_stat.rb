class GameStat < ActiveRecord::Base
	belongs_to :user

  validates :opponent, presence: true
  validates :date, presence: true
  validates :game_stat_year, presence: true
end