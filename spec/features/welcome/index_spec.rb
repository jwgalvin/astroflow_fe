require 'rails_helper'


RSpec.describe 'Welcome page', type: :feature do
  before(:each) do
    @user = User.create!(name: "Bobbo", email: "mep@yall.com", zodiac_sign: "Aquarius")
  end

  it "has a logged out navbar", :vcr do
    stub_omniauth
    visit root_path
    #save_and_open_page
    expect(page).to have_content("Sign or Log In")
    expect(page).to_not have_content("Dashboard")
    expect(page).to_not have_content("Flowchart")
    expect(page).to_not have_content("Log Out")
    expect(page).to_not have_content("Edit profile here")
  end

  it "is linked to from the user registration page", :vcr do
    stub_omniauth
    visit root_path
    click_button 'Register'
    expect(current_path).to eq("/sign_up")
  end

  it "has stuff on the page", :vcr do
    stub_omniauth
    visit root_path
    expect(page).to have_content("ASTROFLOW")
    expect(page).to have_button("Register")
    expect(page).to have_button("Sign In")

  end

  it "After Logging in the dashboard and logout button appear in Navbar ", :vcr do
    stub_omniauth
    visit root_path
    click_button("Sign In")
    #save_and_open_page
  end

  it "has a Register button", :vcr do
    stub_omniauth
    visit root_path
    click_link("Sign or Log In")
    expect(current_path).to eq("/sign_up")
  end

  it 'goes straight to dashboard if already signed in', :vcr do
    stub_omniauth
    user = stub_omniauth[:info]
    visit root_path
    click_button 'Sign In'

    fill_in 'name', with: "Sporty Spice"
    select "Aquarius", from: :zodiac_sign

    click_on('Save')
    click_button("Log Out")
    click_button("Sign In")
    #save_and_open_page
    
    expect(current_path).to eq("/dashboard")
  end
end
