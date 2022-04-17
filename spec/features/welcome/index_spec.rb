require 'rails_helper'

RSpec.describe 'Welcome page', type: :feature do
  before(:each) do
    visit "/"
  end
  it "has stuff on the page" do

    expect(page).to have_content("ASTROFLOW")
    expect(page).to have_button("Register")
    expect(page).to have_button("Sign In")

  end

  it "After Logging in the dashboard and logout button appear in Navbar " do
    click_button("Log In")

  end

  xit "has a Register button" do
    click_button("Register")
    expect(current_path).to eq("/register")
  end
end
