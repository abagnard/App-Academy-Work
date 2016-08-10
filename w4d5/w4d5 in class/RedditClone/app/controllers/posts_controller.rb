class PostsController < ApplicationController

  before_action :not_author, only: [:edit, :update, :destroy]

  def show
    @post = Post.find_by_id(params[:id])
    @author = User.find_by_id(@post.author_id)
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)
    @subs = Sub.all
    @post.author_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
    @subs = Sub.all
  end

  def update
    @post = Post.find_by_id(params[:id])
    @subs = Sub.all
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @sub = Sub.find_by_id(@post.sub_id)
    @post.delete
    redirect_to sub_url(@sub)
  end

end
