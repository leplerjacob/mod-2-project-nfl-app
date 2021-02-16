class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])

      session[:user_id] = @user.id
      redirect_to user_path(@user), flash: { success: "Successfuly logged in" }
    else
      flash.now[:alert] = "Invalid credentials"
      render :new
    end
  end

  def destroy
  end
end
