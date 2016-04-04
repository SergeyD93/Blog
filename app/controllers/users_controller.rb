class UsersController < ApplicationController

  def index
    @title = "Sign up"
    #@user = User.all
  end

  def new
    #@user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render 'new'
    end
  end

  def show

    @user = User.find(params[:id])
    @title = @user.login

  end

  private
  def user_params
    params.require(:user).permit(:login, :avatar_link, :password, :password_confirmation)
  end
end
