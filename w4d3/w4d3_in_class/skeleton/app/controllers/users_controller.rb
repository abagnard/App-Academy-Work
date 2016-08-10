class UsersController < ApplicationController

  before_action :goto_index, only: [:create, :new]

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @users.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password_digest, :session_token, :password)
  end

end
