class Position < ActiveREcord::Base
  has_many :player_positions
  has_many :users, through: :player_positions
end