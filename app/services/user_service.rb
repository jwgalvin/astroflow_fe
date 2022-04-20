class UserService
  class << self
    def send_user(email)
      response = conn.post("/api/v1/users?email=#{email}")
    end
  private
    def conn
      Faraday.new(url: "https://astro-flow-be.herokuapp.com")
    end
  end
end
