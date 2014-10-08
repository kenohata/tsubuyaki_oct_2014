class SessionsController < ApplicationController
  def new
  end

  def create
    email    = params_session[:email]
    password = params_session[:password]

    if @user = login(email, password)
      redirect_to root_path, notice: "you signed in!"
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  private

  def params_session
    params.permit(:email, :password)
  end
end
