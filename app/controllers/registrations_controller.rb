class RegistrationsController < ApplicationController
  def new
  end

  def create
    @user = User.new(params_registration)

    if @user.save
      redirect_to root_path, notice: "you signed up!"
    else
      render :new
    end
  end

  private

  def params_registration
    params.permit(:email, :password)
  end
end
