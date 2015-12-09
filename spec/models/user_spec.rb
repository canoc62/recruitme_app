require 'rails_helper'

describe User do 
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:school) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:username) }
  it { should ensure_length_of(:password).is_at_least(5) }
  it { should have_many(:player_positions) }
  it { should have_many(:positions).through(:player_positions) }
  it { should have_many(:game_stats) }

  describe "#total_stat_category" do
    let(:user) { Fabricate(:user) }
    before do 
      game_stat_1 = Fabricate(:game_stat, game_stat_year: "Senior", rush_yards: 100, user: user)
      game_stat_2 = Fabricate(:game_stat, game_stat_year: "Senior", rush_yards: 150, user: user)
    end

    it "returns the total amount of a particular stat in a particular year of a user's football career" do
      expect(user.total_stat_category("Senior", "rush_yards")).to eq(250)
    end
    it "returns the total amount of a particular stat, excluding nil values" do
      game_stat_3 = Fabricate(:game_stat, game_stat_year: "Senior", rush_yards: nil, user: user)
      expect(user.total_stat_category("Senior", "rush_yards")).to eq(250)
    end
    it "returns only the total amount of a particular stat that the user owns" do
      user_2 = Fabricate(:user)
      game_stat_3 = Fabricate(:game_stat, game_stat_year: "Senior", rush_yards: 75, user: user_2)
      expect(user.total_stat_category("Senior", "rush_yards")).to eq(250)
    end
    it "returns only the total amount of a particular stat in the given year" do
      game_stat_3 = Fabricate(:game_stat, game_stat_year: "Junior", rush_yards: 125, user: user)
      expect(user.total_stat_category("Senior", "rush_yards")).to eq(250)
    end
  end
end