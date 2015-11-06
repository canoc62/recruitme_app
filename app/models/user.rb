class User < ActiveRecord::Base
  has_many :player_positions
  has_many :positions, through: :player_positions
  has_many :game_stats
  belongs_to :school_year

  has_secure_password validations: false
  validates :password, presence: true, on: :create, length: {minimum: 5}

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :school, presence: true
end