class Horoscope   
  attr_reader :current_date, :description, :compatibility,
              :mood, :color, :lucky_number, 
              :lucky_time, :moon, :moon_phase

  def initialize(data)
    @current_date = data[:current_date]
    @description = data[:description]
    @compatibility = data[:compatibility]
    @mood = data[:mood]
    @color = data[:color]
    @lucky_number = data[:lucky_number]
    @lucky_time = data[:lucky_time]
    @moon = data[:moon]
    @moon_phase = data[:moon_phase]
  end 
end 