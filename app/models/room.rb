class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
  belongs_to :service

  def self.create_room(service, push_user)
    be_pushed_user = service.user
    if service.work == "demand"
      @room = Room.new(name: service.title, rated_user: push_user.id, service_id: service.id)
    elsif service.work == "supply"
      @room = Room.new(name: service.title, rated_user: be_pushed_user.id, service_id: service.id)
    end
    @room.users << [be_pushed_user, push_user]
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
