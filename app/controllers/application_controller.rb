 class ApplicationController < ActionController::Base
  helper_method :current_user, :user

  def error_message(errors)
    errors.full_messages.join(', ')
  end

  def current_user
    session[:access_token].present? #&& UserFacade.get_by_email(session[:email])
  end
end
