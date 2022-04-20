class HoroscopeService
  class << self 
    def call_today_horoscope(zodiac_sign)
      response = conn.get("/api/v1/horoscopes/find?sign=#{zodiac_sign}")
      parse_data(response)
    end 

    private 

    def conn 
      Faraday.new(url: "https://astro-flow-be.herokuapp.com")
    end 

    def parse_data(response)
      data = JSON.parse(response.body, symbolize_names: true)
    end 
  end
end 