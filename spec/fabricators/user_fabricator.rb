Fabricator(:user) do 
  first_name { Faker::Name.name }
  last_name { Faker::Name.name }
  email { Faker::Internet.email }
  password 'password'
  username { Faker::Lorem.words(1).join(" ") }
  city 'Sherman Oaks'
  state 'CA'
  school 'Notre Dame High School'
end