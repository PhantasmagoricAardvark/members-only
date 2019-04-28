class PostsController < ApplicationController
	before_action :logged_in, only: [:new, :create]

	helper_method :logged_in?

  def new
  end

  def create
  	@post = Post.new(user_id: current_user.id, content: post_params[:content])
  	@post.save
  	if @post.save
  		flash[:success] = "Post created"
  		redirect_to posts_path
  	end
  end

  def index
  	@posts = Post.all
  end

  private

  def logged_in
  	if logged_in? == false
  		flash[:danger] = "You need to be logged in!"
  		redirect_to root_url
  	end
  end

  def post_params
  	params.require(:post).permit(:content)
  end
end
