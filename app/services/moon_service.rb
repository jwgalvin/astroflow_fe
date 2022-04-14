class MoonService
  class << self

    def moon_call #moonphases.api
      response = conn.get("sumthin")
      parse_data(response)
    end

  private

    def conn
      Faraday.new(url: "https://moon/stuff", params: {moon_api_key: ENV['api_key']})
    end

    def parse_data(response)
        data = JSON.parse(response.body, symbolize_names: true)
    end

  end
end
