class PostsController < ApplicationController
	before_action :logged_in, only: [:new, :create]

  def new
  end

  def create
  	post = Post.new(user_id: current_user.id, content: post_params[:content])
  	post.save
  	if post.save
  		flash[:success] = "Post created"
  		render "index"
  	end
  end

  def index
  	@posts = Post.all
  end

  private

  def logged_in
  	if logged_in? == false
  		redirect_to root_url
  	end
  end

  def logged_in?
  	false
  end

  def post_params
  	params.require(:post).permit(:content)
  end
end
