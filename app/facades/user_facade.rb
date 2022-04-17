class UserFacade
  class << self
    def add_user(email)
      UserService.send_user(email)
    end
  end
end
