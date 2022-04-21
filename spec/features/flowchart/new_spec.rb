require 'rails_helper'

RSpec.describe 'flowchart page', type: :feature do
  before(:each) do
    stub_omniauth
    user = stub_omniauth[:info]
    visit root_path
    click_link 'Log In'
    fill_in 'name', with: "Sporty Spice"
    select "Aquarius", from: :zodiac_sign
    click_on('Save')
  end


  it "has a logged in navbar", :vcr do
    expect(page).to have_link("Dashboard")
    expect(page).to have_link("Logout")
    expect(page).to have_link("FlowChart")
    expect(page).to_not have_button("Edit profile here")
    expect(page).to_not have_content("Sign or Log in")
  end

  it "is linked to from the user registration page", :vcr  do

    click_link 'FlowChart'

    expect(current_path).to eq("/flowchart")
    expect(page).to have_content("Add Daily Flow Chart Information")
    expect(page).to have_content("Edit Daily Flow Chart Information")
    click_on("Add Daily Flow Chart Information")
    expect(current_path).to eq("/flowchart/new")
  end

  it "is has links to add daily chart", :vcr  do
    click_link 'FlowChart'

    #save_and_open_page
    expect(current_path).to eq("/flowchart")
    expect(page).to have_content("Add Daily Flow Chart Information")
    expect(page).to have_content("Edit Daily Flow Chart Information")
    click_on("Edit Daily Flow Chart Information")
    expect(current_path).to eq("/flowchart/edit")
  end


end
