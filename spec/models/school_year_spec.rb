require 'rails_helper'

describe SchoolYear do 
	it { should have_many(:users) }
end