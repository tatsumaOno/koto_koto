class Service < ApplicationRecord
	validates :title, presence: true,length: {maximum: 30}
	validates :detail, presence: true,length: {maximum: 1000}
	validates :price,presence: true,numericality: {only_integer: true,greater_than_or_equal_to: 500,less_than_or_equal_to: 100000}
	validates :time,presence: true
	validates :work,presence: true
	validates :user_id,presence: true
	validate :image_should_be_presence

	has_one_attached :image
	belongs_to :user
	belongs_to :area
	belongs_to :category

	enum work: {"demand": 0,"supply": 1}

	def image_should_be_presence
		errors.add(:image,:presence) unless image.attached?
	end
end
