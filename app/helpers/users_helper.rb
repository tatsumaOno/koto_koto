module UsersHelper
	 def user_show_image(user)
 		 user.image.attached? ? image_tag(user.image) : image_tag("user_default.jpeg")
 	end

	 def display_score(user)
 		 user.score == nil ? 0 : user.score
 	end
end