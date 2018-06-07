module ApplicationHelper
	def date_look(date)
		date.strftime("%l:%M:%S %p %b %e, %Y")
	end
end
