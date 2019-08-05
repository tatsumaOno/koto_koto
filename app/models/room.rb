class Room < ApplicationRecord
	has_many :room_users
	has_many :users,through: :room_users
	has_many :messages
	belongs_to :service

	def self.create_room(service,send_user)
		receive_user = service.user
		if service.work == "supply"
			@room = Room.new(name: service.title,rated_user: send_user.id,service_id: service.id)
		elsif service.work == "demand"
			@room = Room.new(name: service.title,rated_user: receive_user.id,service_id: service.id)
		end
		@room.users << [receive_user,send_user]
		@room.save
	end

	def find_service_id
		@service = Service.find(self.service_id)
	end

	def change_activated
		self.activated = false
		self.save
	end
end
