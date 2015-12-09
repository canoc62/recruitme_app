Fabricator(:user) do 
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { Faker::Internet.email }
  password 'password'
  username { Faker::Lorem.words(1).join(" ") }
  city 'Sherman Oaks'
  state 'CA'
  school 'Notre Dame High School'
  graduation_year 2009
end