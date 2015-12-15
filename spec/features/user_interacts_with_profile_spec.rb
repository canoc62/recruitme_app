require 'rails_helper'

feature "User interacts with profile" do 
  scenario "user creates and edits profile" do
    Position.create(position_title: "WR")
    Position.create(position_title: "CB")

    go_to_register_page
    fill_in_required_info
    register

    expect_to_see_profile_pic
    expect_to_see_mandatory_info

    check_if_dropdown_links_are_visible

    go_to_edit_profile_page
    edit_info
    update_profile

    expect_to_see_mandatory_info
    expect_to_see_additional_info

    edit_measurables
    fill_in_measurables
    update_measurables
    expect_to_see_measurables
  end

  def go_to_register_page
    visit root_path
    click_link "Register"
    expect(page).to have_content("Register")
  end

  def expect_to_see_profile_pic
    expect(page).to have_css('img[@class=gravatar]')
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
    select('CA', from: 'user_state')
    fill_in('School', with: "Dominguez")
    fill_in('Graduation year', with: 2006)
  end

  def register
    click_button "Register"
  end

  def display_info(content)
    expect(page).to have_content(content)
  end

  def expect_to_see_mandatory_info
    display_info "Richard"
    display_info "Sherman"
    display_info "shutdown25"
    display_info "seahawks25@gmail.com"
    display_info "Compton"
    display_info 'CA'
    display_info "Dominguez"
    display_info 2006
  end

  def check_if_dropdown_links_are_visible
    within(:xpath,"//ul[@class='dropdown-menu']") do
      find_link('View Profile').visible?
      find_link('Logout').visible?
      find_link("Edit Profile").visible?
      find_link("Edit Measurables").visible?
    end
  end

  def go_to_edit_profile_page
    within(:xpath,"//ul[@class='dropdown-menu']") do
      click_link "Edit Profile"
    end
    expect(page).to have_content("Edit Your Profile")
  end

  def edit_info
    select('CA', from: 'user_state')
    fill_in('Age', with: 17)
    select("6'0\"", from: 'user_height')
    fill_in('Weight', with: 185)
    fill_in('Gpa', with: 4.0)
    select("WR", from: 'user_position_ids')
    select("CB", from: 'user_position_ids')
  end

  def update_profile
    click_button "Update Profile"
  end

  def expect_to_see_additional_info
    display_info 17
    display_info "6'0"
    display_info 185
    display_info 4.0
    display_info "WR"
    display_info "CB"
  end

  def edit_measurables
    within(:xpath,"//ul[@class='dropdown-menu']") do
      click_link "Edit Measurables"
      expect(page).to have_content("Edit Measurables")
    end
  end

  def fill_in_measurables
    fill_in('Forty', with: 4.5)
    fill_in('Bench press', with: 250)
    fill_in('Squat', with: 435)
    fill_in('Vertical', with: 32)
    fill_in('Shuttle', with: 4.2)
    fill_in('Three cone', with: 4.1)
    fill_in('Sat', with: 1800)
    fill_in('Act', with: 30)
  end

  def update_measurables
    click_button "Update Measurables"
  end

  def expect_to_see_measurables
    expect(page).to have_content(4.5)
    expect(page).to have_content(250)
    expect(page).to have_content(435)
    expect(page).to have_content(32)
    expect(page).to have_content(4.2)
    expect(page).to have_content(4.1)
    expect(page).to have_content(1800)
    expect(page).to have_content(30)
  end
end