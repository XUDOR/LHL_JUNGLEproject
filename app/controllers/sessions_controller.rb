class SessionsController < ApplicationController
  def new
  end

  def create
  end

  def destroy
    reset_session # This clears the session
    redirect_to root_url, notice: "Logged out!"
  end
end
