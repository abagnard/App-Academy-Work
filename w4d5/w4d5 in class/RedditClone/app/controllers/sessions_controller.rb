class SessionsController < ApplicationController

  def new
    @user = User.new
    @return = true
    render :new
  end

  def create
    username, password = user_params[:username], user_params[:password]
    @user = User.find_by_credentials(username, password)
    if @user
      login(@user)
      redirect_to subs_url
    else
      flash[:errors] = ["invalid username or password"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
