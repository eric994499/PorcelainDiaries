module ApplicationHelper
	def date_look(date)
		date.strftime("%l:%M:%S %p %b %e, %Y")
	end

	def check_avatar(user)
		if user.avatar.nil?
			"No Avatar"
		else
			 image_tag user.avatar
		end
	end
end
