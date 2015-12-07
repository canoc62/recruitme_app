require 'rails_helper'

describe Position do
  it { should have_many(:player_positions) }
  it { should have_many(:users).through(:player_positions) }
end