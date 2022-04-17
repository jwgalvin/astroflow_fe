class UserService
  class << self

    def send_user(email)
      response = conn.post("/api/v1/users?email=#{email}")
      #parse_data(response)
    end

  private

    def conn
      Faraday.new(url: "http://localhost:5000")
    end

    def parse_data(response)
        data = JSON.parse(response.body, symbolize_names: true)
    end

  end
end
