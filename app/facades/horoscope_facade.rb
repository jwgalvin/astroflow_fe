class HoroscopeFacade 
  class << self 
    def get_today_horoscope(zodiac_sign)
      data = HoroscopeService.call_today_horoscope(zodiac_sign)
      horoscope(data)
    end 

    # def get_tomorrow_horoscope(zodiac_sign)
    #   HoroscopeService.call_tomorrow_horoscope(zodiac_sign)
    # end 

    # def get_yesterday_horoscope(zodiac_sign)
    #   HoroscopeService.call_yesterday_horoscope(zodiac_sign)
    # end 

    private 
    
    def horoscope(data) 
      data1 = data[:today_horoscope]
      data2 = data[:yesterday_horoscope]
    
      horoscopes = [
        Horoscope.new(current_date: data1[:current_date], description: data1[:description],
                      compatibility: data1[:compatibility], color: data1[:color],
                      mood: data1[:mood], lucky_number: data1[:lucky_number], 
                      lucky_time: data1[:lucky_time], moon: data1[:moon], moon_phase: data1[:moon_phase]),

        Horoscope.new(current_date: data2[:current_date], description: data2[:description], 
                      compatibility: data1[:compatibility], color: data1[:color],
                      mood: data2[:mood], lucky_number: data2[:lucky_number], 
                      lucky_time: data2[:lucky_time], moon: data2[:moon], moon_phase: data2[:moon_phase]),

      ]
    end 
  end 
end 