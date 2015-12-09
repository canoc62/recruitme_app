class User < ActiveRecord::Base
  has_many :player_positions
  has_many :positions, through: :player_positions
  has_many :game_stats

  has_secure_password validations: false
  validates :password, presence: true, on: :create, length: {minimum: 5}

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :school, presence: true


  def total_stat_category(year, category)
    total = 0
    self.game_stats.each do |game_stat|
      if game_stat.game_stat_year == year
        total += game_stat.read_attribute(category) if !game_stat.read_attribute(category).nil?
      end
    end
    total
  end
end