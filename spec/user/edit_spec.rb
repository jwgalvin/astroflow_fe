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

  it "has an edit a profile page", :vcr do
    click_button("Edit profile here")
    expect(current_path).to eq("/edit")
  end

  it "can edit the user", :vcr do

    click_button("Edit profile here")
    fill_in 'name', with: "Sturdy Spice"
    select "Aries", from: :zodiac_sign
    click_on('Save')
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome Sturdy Spice")
    expect(page).to_not have_content("Welcome Sporty Spice")
    #save_and_open_page
  end
end
