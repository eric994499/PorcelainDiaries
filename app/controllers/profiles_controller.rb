class ProfilesController < ApplicationController
 wrap_parameters :profile, include: [:email, :password, :password_confirmation]
	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(allowed_params)
		if @profile.save
			session[:profile_id] = @profile.id
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render "new"
		end

	end

    private 

	def allowed_params
		params.require(:profile).permit(:email, :password, :password_confirmation)
	end
end
