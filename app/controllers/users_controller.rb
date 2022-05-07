class UsersController < ApplicationController

  def sign_in
    auth_hash = request.env['omniauth.auth']
    email = auth_hash['info']['email']
    user = User.find_or_create_by(email: email)
    session[:access_token] = auth_hash['info']['email']
    if !user.zodiac_sign || !user.name
      UserFacade.add_user(email)
      flash[:alert] = "error: #{error_message(user.errors)}"
      redirect_to "/sign_up"
    else
      redirect_to "/flowchart/new"
    end
  end

  def sign_up
    user = User.find_or_create_by(email: session[:access_token])
    if params.include?("zodiac_sign")

      user.update(user_params)
      redirect_to "/flowchart/new"
    end
  end


  def show
    @user = User.find_by(email: session[:access_token])
      # if !@user.zodiac_sign
      #   redirect_to "/register"
      # end
    horoscopes = HoroscopeFacade.get_today_horoscope(@user.zodiac_sign)
    @today_horoscope = horoscopes.first
    @yesterday_horoscope = horoscopes.last
  end

  def edit
    user = User.find_by(email: session[:access_token])

    if params[:name] && params[:zodiac_sign]
      user.update(user_params)
      redirect_to "/dashboard"
    end
  end


  def logout
    session.destroy
    redirect_to "/"
  end

  private

  def user_params
    params.permit(:name, :email, :zodiac_sign)
  end

end
