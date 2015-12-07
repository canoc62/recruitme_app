require 'rails_helper'

describe GameStat do 
  it { should belong_to(:user) }
  it { should validate_presence_of(:opponent) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:game_stat_year) }
end