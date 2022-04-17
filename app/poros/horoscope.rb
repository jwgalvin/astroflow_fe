class Horoscope   
  attr_reader :date, :description, :mood, :lucky_number 

  def initialize(data)
    @date = data[:date]
    @description = data[:description]
    @mood = data[:mood]
    @lucky_number = data[:lucky_number]
  end 
end 