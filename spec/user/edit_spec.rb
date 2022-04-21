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
end
