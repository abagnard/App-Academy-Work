class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.save
      log_in_user!(user)
      redirect_to user_url(user)
    else
      render json: "Credentials were wrong"
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
  
end
