require 'rails_helper'


RSpec.describe 'Welcome page', type: :feature do
  before(:each) do
    @user = User.create!(name: "Bobbo", email: "mep@yall.com", zodiac_sign: "Aquarius")
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


end
