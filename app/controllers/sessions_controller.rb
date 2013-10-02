class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = login(params[:email], params[:password])
  	if @user
  		redirect_back_or_to root_url, :notice => "Logged in!"
  	else
  		flash.now[:alert] = "Invalid email or password, please try again."
  		render :new
  	end
  end

  	def destroy
  		session[:user_id] = nil
      flash[:notice] = "Successfully Logged out... Good Bye"
  		redirect_to root_url
  	end
end
