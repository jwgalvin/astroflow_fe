require 'rails_helper'


RSpec.describe 'Welcome page', type: :feature do
  before(:each) do
    @user = User.create!(name: "Bobbo", email: "mep@yall.com", zodiac_sign: "aquarius")
  end

  it "is linked to from the user registration page", :vcr do
    stub_omniauth
    visit root_path
    click_button 'Sign In'
    click_button 'Dashboard'
    save_and_open_page
  end
end
