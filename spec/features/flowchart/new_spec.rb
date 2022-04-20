require 'rails_helper'


RSpec.describe 'flowchart page', type: :feature do
  before(:each) do
    @user = User.create!(name: "Bobbo", email: "mep@yall.com", zodiac_sign: "Aquarius")
  end


  it "is linked to from the user registration page", :vcr  do
    stub_omniauth
    user = stub_omniauth[:info]
    visit root_path
    click_button 'Sign In'

    fill_in 'name', with: "Sporty Spice"
    select "Aquarius", from: :zodiac_sign

    click_on('Save')
    click_button 'Flowchart'
    #save_and_open_page
    expect(current_path).to eq("/flowchart")
  end
end
