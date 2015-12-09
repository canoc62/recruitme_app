def set_current_user(user=nil)
  session[:user_id] = (user ||= Fabricate(:user)).id
end

def sign_in(user=nil)
  player = user || Fabricate(:user)
  visit root_path
  fill_in "Username", with: player.email
  fill_in "Password", with: player.Password
  click_button "Login"
end

def create_user
  visit root_path
  click_button "Register"


end