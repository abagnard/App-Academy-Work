class SubsController < ApplicationController

  before_action :not_moderator, only: [:edit, :update]
  before_action :user_logged_in?, only: [:new, :create]

  helper_method :is_moderator?

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find_by_id(params[:id])
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render new_sub_url
    end
  end

  def edit
    @sub = Sub.find_by_id(params[:id])
  end

  def update
    @sub = Sub.find_by_id(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errrors.full_messages
      render edit_sub_url(@sub)
    end
  end





end
