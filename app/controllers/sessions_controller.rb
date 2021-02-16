class SessionsController < ApplicationController
  helper_method :logged_in_user

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])

      session[:user_id] = @user.id
      session[:email] = @user.email
      redirect_to user_path(@user), flash: { success: "Successfuly logged in" }
    else
      flash.now[:alert] = "Invalid credentials"
      render :new
    end
  end

  # def logged_in?
  #   !current_user.nil?
  # end

  # def logged_in_user
  #    unless logged_in?
  #       flash[:danger] = "Please log in."
  #       redirect_to login_path
  #    end
  # end

  def logout
    reset_session
    session.delete :user_id
    session.delete :email
    redirect_to login_path
  end

end
