class SessionsController < ApplicationController
  helper_method :logged_in?


  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user.authenticate(params[:session][:password])	 
  		log_in(user) 
 			redirect_to root_path
    else
      flash[:danger] = "Error"
      render "new"
   	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end

end
