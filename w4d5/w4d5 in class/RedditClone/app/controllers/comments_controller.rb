class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:id]
    @comment.author_id = current_user.id
    @post = Post.find_by_id(@comment.post_id)
    if @comment.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find_by_id(params[:id])
    @children = @comment.children.order(:created_at)
    @author = @comment.author
    @post = @comment.post
  end

end
