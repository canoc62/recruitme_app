require 'rails_helper'
require 'pry'

feature "User adds game stat" do 
  scenario "User creates and adds game stat" do
    sign_in

    expect(page).to have_link("Add Game Statistics")
    expect(page).to have_link("Freshman Stats")
    expect(page).to have_link("Sophomore Stats")
    expect(page).to have_link("Junior Stats")
    expect(page).to have_link("Senior Stats")

    within("//div[@id=stats]") do
      page.has_css?('table')
      within(:xpath,"//table") do
        expect(page).to have_content("Year")
        expect(page).to have_content("Date")
        expect(page).to have_content("Opponent")
        expect(page).to have_content("Pass Att")
        expect(page).to have_content("Pass Comp")
        expect(page).to have_content("Pass Yds")
        expect(page).to have_content("Pass TD")
        expect(page).to have_content("Pass Int")
        expect(page).to have_content("Rush Att")
        expect(page).to have_content("Rush Yds")
        expect(page).to have_content("Rush TD")
        expect(page).to have_content("Rec")
        expect(page).to have_content("Rec Yds")
        expect(page).to have_content("Rec TD")
        expect(page).to have_content("Fumbles")
        expect(page).to have_content("Fumbles Lost")
        expect(page).to have_content("Tackles")
        expect(page).to have_content("Sacks")
        expect(page).to have_content("Int")
        expect(page).to have_content("FGA")
        expect(page).to have_content("FGM")
        expect(page).to have_content("PAT Att")
        expect(page).to have_content("PAT Made")
        expect(page).to have_content("Total")
      end
    end

    click_link "Add Game Statistics"
    within(:xpath,"//div//h1") do
      expect(page).to have_content("Game Statistics")
    end

    select("Senior", from: 'game_stat_game_stat_year')
    fill_in("Date", with: "01/09/2005")
    fill_in("Opponent", with: "Inglewood")
    fill_in("Pass attempts", with: 1)
    fill_in("Pass completions", with: 1)
    fill_in("Pass yards", with: 32)
    fill_in("Pass tds", with: 1)
    fill_in("Pass int", with: 0)
    fill_in("Rush attempts", with: 2)
    fill_in("Rush yards", with: 10)
    fill_in("Rush tds", with: 1)
    fill_in("Receptions", with: 7)
    fill_in("Receiving yards", with: 123)
    fill_in("Receiving tds", with: 1)
    fill_in("Fumbles", with: 0)
    fill_in("Fumbles lost", with: 0)
    fill_in("Tackles", with: 2)
    fill_in("Sacks", with: 0)
    fill_in("Interceptions", with: 1)
    fill_in("Field goal attempts", with: 1)
    fill_in("Field goals made", with: 1)
    fill_in("Pat attempts", with: 5)
    fill_in("Pat made", with: 5)
    click_button "Submit Stats"

    # Edit stat
    click_link "Senior Stats"

    within("//div[@id=stats]") do
      # Going to have to find a way to differentiate multiple Edit links
      # when more game stats are added. (Solve the find exact row, column problem).
      click_link "Edit"
    end
    within(:xpath,"//div//h1") do
      expect(page).to have_content("Edit Game Statistics")
    end
    select("Senior", from: 'game_stat_game_stat_year')
    fill_in("Opponent", with: "Compton")
    click_button "Update Stats"

    # Create another stat
    click_link "Add Game Statistics"

    select("Senior", from: 'game_stat_game_stat_year')
    fill_in("Date", with: "01/10/2005")
    fill_in("Opponent", with: "Serra")
    fill_in("Receptions", with: 7)
    fill_in("Receiving yards", with: 123)
    fill_in("Receiving tds", with: 1)
    click_button "Submit Stats"

    click_link "Senior Stats"

  # Validates presence of content on page
    expect(page).to have_content("Senior")
    expect(page).to have_content("2005-09-01")
    expect(page).to have_content("Compton")
    expect(page).to have_content("1")
    expect(page).to have_content("2")
    expect(page).not_to have_content("Inglewood")
    expect(page).to have_content("10")
    expect(page).to have_content("7")
    expect(page).to have_content("123")
    expect(page).to have_content("5")
    expect(page).to have_content("2005-10-01")
    expect(page).to have_content("246")

  # Validates absence of content on page
    click_link "Freshman Stats"

    expect(page).not_to have_content("Inglewood")


  # Test for correct location of content in table
    #binding.pry
    #find_within_cell(2,1,"Freshman")

  end

  def find_within_cell(row_num, col_num, content)
    expect(find(:xpath,"//table[@id='user_game_stat_table']//tr[#{row_num}]//td[#{col_num}]")).to have_content(content) 
  end
  
end