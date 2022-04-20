require 'rails_helper'


RSpec.describe 'flowchart page', type: :feature do
  before(:each) do
    @user = User.create!(name: "Bobbo", email: "mep@yall.com", zodiac_sign: "Aquarius")
  end

  xit "is linked to from the user registration page", :vcr do
    stub_omniauth
    visit root_path
    click_button 'Sign In'
    fill_in 'name', with: "Sporty Spice"
    click_button 'submit'
    save_and_open_page
    click_button 'Dashboard'
  end
end
