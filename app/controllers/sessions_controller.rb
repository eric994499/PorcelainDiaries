class SessionsController < ApplicationController
  def new
  end
  def create
  	profile = Profile.find_by(email: params[:email])
  	if profile && profile.authenticate(params[:password])
  		session[:profile_id] = profile.id
  		redirect_to root_url, notice: "Logged in!"
  	else
  		flash.now.alert = "Email or Password invalid!"
      render :new
  	end
  end
  
  def destroy
    session[:profile_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
