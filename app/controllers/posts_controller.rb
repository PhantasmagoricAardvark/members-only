class PostsController < ApplicationController
	before_action :logged_in, only: [:new, :create]

  def new
  end

  def create
  end

  def index
  end

  private

  def logged_in
  	if logged_in? == false
  		redirect_to root_url
  	end
  end
end
