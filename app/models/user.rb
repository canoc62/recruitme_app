class User < ActiveRecord::Base
  has_many :player_positions
  has_many :positions, through: :player_positions

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :city, presence: :true
  validates :state, presence: :true
  validates :school, presence: :true
end