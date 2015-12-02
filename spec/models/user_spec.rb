require 'rails_helper'

describe User do 
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:city)}
  it {should validate_presence_of(:state)}
  it {should validate_presence_of(:school)}
  it {should validate_presence_of(:password)}
  it {should validate_uniqueness_of(:username)}
  it {should have_many(:player_positions)}
  it {should have_many(:positions)}
  it {should have_many(:game_stats)}
  it {should belong_to(:school_year)}

  describe "#total_stat_category" do
      it "returns the total amount of a particular stat in a particular year of a user's football career" do
        user = Fabricate(:user)
        game_stat_1 = Fabricate(:game_stat, game_stat_year: "Senior", rush_yards: 100, user: user)
        game_stat_2 = Fabricate(:game_stat, game_stat_year: "Senior", rush_yards: 150, user: user)
        expect(user.total_stat_category("Senior", "rush_yards")).to eq(250)
    end
  end
end