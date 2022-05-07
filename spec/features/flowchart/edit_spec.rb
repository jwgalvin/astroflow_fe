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
    click_link 'FlowChart'
    click_on("Add Daily Flow Chart Information")
    fill_in 'emotion', with: "Sporty"
    select 'Yes', from: :bloating
    select 'No', from: :cramps
    select 'Moderate', from: :flow_status
    click_on("Submit")
    click_on("Edit Daily Flow Chart Information")
  end

  it "has an edit a flowchart form", :vcr do
    expect(page).to have_content("Date")
    expect(page).to have_content("Bloating")
    expect(page).to have_content("Cramps")
    expect(page).to have_content("Flow status")
    expect(page).to have_content("How are you feeling emotionally?")
  end

  xit "fills in the things", :vcr do

    fill_in 'emotion', with: "Tired"
    select 'No', from: :bloating
    select 'Yes', from: :cramps
    select 'Heavy', from: :flow_status
    click_on("Submit")
    #save_and_open_page
    expect(current_path).to eq("/flowchart")

  end
end
