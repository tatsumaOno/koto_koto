class Service < ApplicationRecord
	validates :title, presence: true,length: {maximum: 30}
	validates :detail, presence: true,length: {maximum: 1000}
	validates :price,presence: true,numericality: {only_integer: true,greater_than_or_equal_to: 500,less_than_or_equal_to: 100000}
	validates :time,presence: true
	validates :work,presence: true
	validates :user_id,presence: true
	has_one_attached :image
	
	belongs_to :user

	enum work: {"demand": 0,"supply": 1}
end