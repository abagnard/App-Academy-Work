require 'byebug'

class UsersController < ApplicationController
  def index
    # byebug
    render json: User.all
  end

  def create
    byebug
    user1 = User.new(user_params)
    if user1.save
      render json: user1
    else
      render json: user1.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.destroy
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
