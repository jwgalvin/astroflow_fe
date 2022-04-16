class UsersController < ApplicationController

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    email = auth_hash['info']['email']
    #binding.pry
    user = User.find_by(email: email)
    session[:access_token] = auth_hash['credentials']['token']
    #redirect_to "dashboard"
  end

  def show
    # if params.include?("party_id")
    #  @user = User.find(params[:id])
    #  change_status(params[:party_id])
    # else
    #   @user = User.find_by(id: session[:user_id])
    # end
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    #binding.pry
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/dashboard?=#{user.email}"
    elsif user.authenticate(params[:password]) == false
      flash[:error]= "You ain't nobody"
      render :login_form
    elsif !user
      flash[error] = "You ain't them! Try again"
      render :login_form
    end
  end

  def logout
    session.destroy
    redirect_to "/"
  end

  private
    def user_params
      #params.permit(:name, :email)
    end


end
