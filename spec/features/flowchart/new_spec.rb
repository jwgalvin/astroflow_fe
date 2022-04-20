require 'rails_helper'

RSpec.describe 'flowchart page', type: :feature do
  before(:each) do
    stub_omniauth
    user = stub_omniauth[:info]
    visit root_path
    click_button 'Sign In'

    fill_in 'name', with: "Sporty Spice"
    select "Aquarius", from: :zodiac_sign

    click_on('Save')
  end


  it "has a logged in navbar", :vcr do
    expect(page).to have_button("Dashboard")
    expect(page).to have_button("Log Out")
    expect(page).to have_button("Flowchart")
    expect(page).to have_button("Edit profile here")
    expect(page).to_not have_content("Sign or Log in")
  end

  it "is linked to from the user registration page", :vcr  do

    click_button 'Flowchart'
    #save_and_open_page
    expect(current_path).to eq("/flowchart")
    expect(page).to have_content("Add Daily Flow Chart Information")
    expect(page).to have_content("Edit Daily Flow Chart Information")
  end

  it "is has links to add daily chart", :vcr  do
    click_button 'Flowchart'
    #save_and_open_page
    expect(current_path).to eq("/flowchart")
    expect(page).to have_content("Add Daily Flow Chart Information")
    expect(page).to have_content("Edit Daily Flow Chart Information")
  end

  it "has a link to edit the daily chart", :vcr  do
    #ave_and_open_page
    click_button 'Flowchart'
    expect(current_path).to eq("/flowchart")
    expect(page).to have_content("Edit Daily Flow Chart Information")
  end

  it "has a link to edit the daily chart", :vcr  do
    click_button 'Flowchart'
    click_link("Add Daily Flow Chart Information")
    expect(current_path).to eq("/flowchart/new")
    fill_in 'emotion', with: "hankering for food"
    select 'Light', from: 'flow_status'
    #click_on('Submit')

  #  expect(current_path).to eq("/flowchart")
  end

end
