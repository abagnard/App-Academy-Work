class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :is_author?, :is_moderator?

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def user_logged_in?
    if current_user.nil?
      redirect_to new_session_url
    end
  end

  def login(user)
    session[:session_token] = user.session_token
  end

  def logout!
    current_user.session_token = User.generate_session_token
    session[:session_token] = nil
  end

  def not_moderator
    @sub = Sub.find_by_id(params[:id])
    unless is_moderator?(@sub)
      flash[:errors] = ['You are not the moderator of this Sub']
      redirect_to sub_url(@sub)
    end
  end

  def is_moderator?(subby)
    current_user.id == subby.moderator_id
  end

  def is_author?(post)
    post.author_id == current_user.id
  end

  def not_author
    @post = Post.find_by_id(params[:id])
    unless is_author?(@post)
      flash[:errors] = ['You are not the author of this post!']
      redirect_to post_url(@post)
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def post_params
    params.require(:post).permit(:title, :content, :url, sub_ids:[])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end


end
