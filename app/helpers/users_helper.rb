module UsersHelper
	def user_show_image(user)
		if user.image.attached?
			image_tag(user.image)
		else
			image_tag("user_default.jpeg")
		end
	end
end