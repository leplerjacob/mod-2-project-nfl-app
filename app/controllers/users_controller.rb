class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.valid?
      redirect_to login_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private
    def user_params
      params.require(:user).permit(:player_name, :username, :password, :password_confirmation, :email, :phone_number)
    end
end
