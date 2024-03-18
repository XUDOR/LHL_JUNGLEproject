class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # User is authenticated
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      # Authentication failed
      flash.now[:alert] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Logged out!"
  end
  
end
