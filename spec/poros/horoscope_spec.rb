require 'rails_helper'
RSpec.describe Horoscope do
  it "exists with attributes" do
    data = {:current_date => "test",
    :description => "test",
    :compatibility => "test",
    :mood => "test",
    :color => "test",
    :lucky_number => "test",
    :lucky_time => "test",
    :moon => "test",
    :moon_phase => "test"}

    new_data = Horoscope.new(data)
  end
end
