require 'rails_helper'

describe PlayerPosition do
  it {should belong_to(:user)}
  it {should belong_to(:position)}
end