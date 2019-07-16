class Room < ApplicationRecord
	has_many :room_users
	has_many :users,through: :room_users
	has_many :messages

	def self.create_room(service,buy_user)
		sell_user = service.user
		@room = Room.new(name: service.title)
		@room.users << [sell_user,buy_user]
		@room.save
	end
end
