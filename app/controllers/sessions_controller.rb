class SessionsController < ApplicationController

  def new
    if signed_in?
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(login: params[:session][:login])
=begin    if user.nil?
      flash.now[:error] = 'Invalid user'
      render 'new'
    else
      sign_in user
      redirect_to user
    end


    if User.authenticate(params[:session][:login], params[:session][:password])
      redirect_to user
    else
      flash.now[:error] = 'bad auth'
      render 'new'
    end
=end

    if user && User.authenticate(params[:session][:login], params[:session][:password])
      sign_in user
      redirect_to user
    else

      flash.now[:error] = 'Invalid login/password combination' # Not quite right!
      render 'new'
    end


  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
