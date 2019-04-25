class PostsController < ApplicationController
	before_action :logged_in, only: [:new, :create]

  def new
  end

  def create
  	debugger
  	post = Post.new(user_id: User.find(current_user.user_id), content: post_params[:content])
  	if post.save
  		flash[:success] = "Post created"
  	end
  end

  def index
  end

  private

  def logged_in
  	if logged_in? == false
  		redirect_to root_url
  	end
  end

  def post_params
  	params.require(:post).permit(:content)
  end
end
