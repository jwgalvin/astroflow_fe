class HoroscopeFacade 
  class << self 
    def get_today_horoscope(zodiac_sign, day)
      data = HoroscopeService.call_today_horoscope(zodiac_sign, day)
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
      Horoscope.new(date: data[:current_date], description: data[:description], mood: data[:mood], lucky_number: data[:lucky_number])
    end 
  end 
end 