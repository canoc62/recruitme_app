require 'rails_helper'

feature "User interacts with profile" do 
  scenario "user creates and edits profile" do

    visit root_path
    click_link "Register"
    expect(page).to have_content("Register")

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

    click_button "Register"

    expect(page).to have_content("Richard")
    expect(page).to have_content("Sherman")
    expect(page).to have_content("shutdown25")
    expect(page).to have_content("seahawks25@gmail.com")
    expect(page).to have_content("Compton")
    expect(page).to have_content("CA")
    expect(page).to have_content("Dominguez")

  end
end