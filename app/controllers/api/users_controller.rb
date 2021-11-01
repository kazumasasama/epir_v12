class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
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

  private
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:id, :irst_name, :last_name, :email, :password, :phone, :line_id, :birthday, :gender, :zip, :prefecture, :address, :memo, :customer_note, :vip, :danger, :event_id)
  end
end
