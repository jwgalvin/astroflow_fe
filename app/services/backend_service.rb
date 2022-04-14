class BackendService
  class << self

    def user_call #
      response = conn.get("sumthin")
      parse_data(response)
    end

  private

    def conn
      Faraday.new(url: "our_backend", params: {api_key: ENV['api_key']})
    end

    def parse_data(response)
      data = JSON.parse(response.body, symbolize_names: true)
    end

  end
end
