class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid? && @user.errors.empty?
      redirect_to user_login_path, flash: { success: "Account successfully created", instruction: "Log into your new account to get started" }
    else
      @user.errors.each do |error|
        flash.now[error.attribute] = error.full_message
      end
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def edit
  end

  def update
  end

  private
    def user_params
      params.require(:user).permit(:name_id, :username, :password, :password_confirmation, :email, :phone_number)
    end
end
