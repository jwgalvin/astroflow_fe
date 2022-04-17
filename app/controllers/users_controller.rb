class UsersController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    email = auth_hash['info']['email']
    user = User.find_or_create_by(email: email)
    session[:access_token] = auth_hash['info']['email']

    UserFacade.add_user(email)
    if !user.dob || !user.name
      redirect_to "/register"
    else
      redirect_to "/dashboard"
    end
  end

  def index
    @user = User.find_by(email: session[:access_token])
    if !@user.dob
      redirect_to "/register"
    end

  end

  def show
    binding.pry
  end

  def edit
    user = User.find_by(email: session[:access_token])
    if params[:name] && params[:dob]
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
    params.permit(:name, :email, :dob)
  end

end
