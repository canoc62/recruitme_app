require 'rails_helper'

feature "User interacts with profile" do 
  scenario "user creates and edits profile" do
    Position.create(position_title: "WR")
    Position.create(position_title: "CB")
    
    go_to_register_page
    fill_in_required_info
    register

    see_mandatory_info

    check_if_dropdown_links_are_visible

    go_to_edit_profile_page
    fill_in_additional_info
    update_profile

    see_mandatory_info
    see_additional_info
  end

  def go_to_register_page
    visit root_path
    click_link "Register"
    expect(page).to have_content("Register")
  end

  def fill_in_required_info
    fill_in('First name', with: "Richard")
    fill_in('Last name', with: "Sherman")
    within("//div.well") do
      fill_in('Username', with: "shutdown25")
      fill_in('Password', with: "password")
    end
    fill_in('Email', with: "seahawks25@gmail.com")
    fill_in('City', with: "Compton")
    fill_in('State', with: "CA")
    fill_in('School', with: "Dominguez")
    fill_in('Graduation year', with: 2006)
  end

  def register
    click_button "Register"
  end

  def display_info(content)
    expect(page).to have_content(content)
  end

  def see_mandatory_info
    display_info "Richard"
    display_info "Sherman"
    display_info "shutdown25"
    display_info "seahawks25@gmail.com"
    display_info "Compton"
    display_info "CA"
    display_info "Dominguez"
    display_info 2006
  end

  def check_if_dropdown_links_are_visible
    within(:xpath,"//ul[@class='dropdown-menu']") do
      find_link('View Profile').visible?
      find_link('Logout').visible?
      find_link("Edit Profile").visible?
    end
  end

  def check_if_dropdown_links_are_visible
    within(:xpath,"//ul[@class='dropdown-menu']") do
      find_link('View Profile').visible?
      find_link('Logout').visible?
      find_link("Edit Profile").visible?
    end
  end

  def go_to_edit_profile_page
    within(:xpath,"//ul[@class='dropdown-menu']") do
      click_link "Edit Profile"
    end
    expect(page).to have_content("Edit Your Profile")
  end

  def fill_in_additional_info
    fill_in('Age', with: 17)
    fill_in('Height', with: "6'0")
    fill_in('Weight', with: 185)
    fill_in('Gpa', with: 4.0)
    select("WR", from: 'user_position_ids')
    select("CB", from: 'user_position_ids')
  end

  def update_profile
    click_button "Update Profile"
  end

  def see_additional_info
    display_info 17
    display_info "6'0"
    display_info 185
    display_info 4.0
    display_info "WR"
    display_info "CB"
  end
end