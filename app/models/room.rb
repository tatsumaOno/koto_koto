class Room < ApplicationRecord
	has_many :room_users
	has_many :users,through: :room_users
	has_many :messages

	def self.create_room(service,send_user)
		receive_user = service.user
		if service.work == "supply"
			@room = Room.new(name: service.title,push_user: send_user.id)
		elsif service.work == "demand"
			@room = Room.new(name: service.title,push_user: receive_user.id)
		end
		@room.users << [receive_user,send_user]
		@room.save
	end
end
