class Room < ApplicationRecord
	has_many :messages

	def self.create_room(service,send_user)
		receive_user = service.user
		@room = Room.new(name: service.title,send_user: send_user,receive_user: receive_user)
		@room.save
	end
end
