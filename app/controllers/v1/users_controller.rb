class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    
  else
    @error_message = "間違ってますよ"
    @email = params[:email]
    @password = params[:password]
    render("users/login_form")
  end
end