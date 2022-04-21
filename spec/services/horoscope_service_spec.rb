require 'rails_helper'

RSpec.describe HoroscopeService do
  it "returns horoscope", :vcr do
    zodiac_sign = 'Leo'
    search = HoroscopeService.call_today_horoscope(zodiac_sign)
    #binding.pry
    expect(search).to be_a Hash
  end

  it "returns today_horoscope", :vcr do
    zodiac_sign = 'Leo'
    search = HoroscopeService.call_today_horoscope(zodiac_sign)
    today = search[:today_horoscope]
    #binding.pry
    expect(search).to be_a Hash
    expect(today.count).to eq(9)
    expect(today[:compatibility]).to be_a(String)
    expect(today[:mood]).to be_a(String)
    expect(today[:color]).to be_a(String)
    expect(today[:lucky_number]).to be_a(String)
    expect(today[:lucky_time]).to be_a(String)
    expect(today[:moon]).to be_a(String)
    expect(today[:moon_phase]).to be_a(String)
    expect(today[:description]).to be_a(String)
  end

  it "returns yesterdays_horoscope", :vcr do
    zodiac_sign = 'Leo'
    search = HoroscopeService.call_today_horoscope(zodiac_sign)
    yesterday = search[:yesterday_horoscope]
    #binding.pry
    expect(search).to be_a Hash
    expect(yesterday.count).to eq(9)
    expect(yesterday[:compatibility]).to be_a(String)
    expect(yesterday[:mood]).to be_a(String)
    expect(yesterday[:color]).to be_a(String)
    expect(yesterday[:lucky_number]).to be_a(String)
    expect(yesterday[:lucky_time]).to be_a(String)
    expect(yesterday[:moon]).to be_a(String)
    expect(yesterday[:moon_phase]).to be_a(String)
    expect(yesterday[:description]).to be_a(String)
  end
end
