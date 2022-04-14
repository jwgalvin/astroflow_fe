class AstrologyService
  class << self

    def astrology_call #
      response = conn.get("sumthin")
      parse_data(response)
    end

    def astrology_house
      response = conn.get("sumthin/houses/")
      parse_data(response)
    end

  private

    def conn
      Faraday.new(url: "https://json.astrologyapi.com/v1/", params: {astro_api_key: ENV['api_key']})
    end

    def parse_data(response)
        data = JSON.parse(response.body, symbolize_names: true)
    end

  end
end
