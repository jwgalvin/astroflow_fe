class UsersController < ApplicationController

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    email = auth_hash['info']['email']
    user = User.find_or_create_by(email: email)
    session[:access_token] = auth_hash['credentials']['token']
    # user = User.create(user_params)

    # if user.save
    #   session[:user_id] = user.id
    #   redirect_to "/users/dashboard?=#{user.email}"
    # else
    #   redirect_to "/register"
    #   flash[:alert] = "Error: #{error_message(user.errors)}"
      #flash[:alert] = "Error: #{user.errors.full_messages.to_sentence}"
    # end
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
