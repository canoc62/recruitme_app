Fabricator(:game_stat) do 
  opponent { Faker::Name.last_name } 
  date { Faker::Date.between(2.days.ago, Date.today) }
  game_stat_year { "Senior" }
end