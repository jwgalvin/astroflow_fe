class HoroscopeService
  class << self 
    def call_today_horoscope(zodiac_sign, day)
      response = conn.get("/api/v1/horoscopes/find?sign=#{zodiac_sign}&day=#{day}")
      parse_data(response)
    end 

    # def call_tomorrow_horoscope(zodiac_sign)
    #   response = conn.post("/?sign=#{zodiac_sign}&day=tomorrow")
    #   parse_data(response)
    # end 

    # def call_yesterday_horoscope(zodiac_sign)
    #   response = conn.post("/?sign=#{zodiac_sign}&day=yesterday")
    #   parse_data(response)
    # end 

    private 

    def conn 
      Faraday.new(url: "http://localhost:5000")
    end 

    def parse_data(response)
      data = JSON.parse(response.body, symbolize_names: true)
    end 
  end
end 