class UserService
  class << self
    def send_user(email)
      response = conn.post("/api/v1/users?email=#{email}")
    end
  private
    def conn
      Faraday.new(url: "http://localhost:5000")
    end
  end
end
