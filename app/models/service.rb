class Service < ApplicationRecord
	validates :title, presence: true,length: {maximum: 30}
	validates :detail, presence: true,length: {maximum: 1000}
	validates :price,presence: true,numericality: {only_integer: true,greater_than_or_equal_to: 500,less_than_or_equal_to: 100000}
	validates :time,presence: true
	validates :work,presence: true
	validates :user_id,presence: true
	validate :image_should_be_presence

	has_one_attached :image
	has_many   :comments, dependent: :destroy
	
	belongs_to :user
	belongs_to :area
	belongs_to :category

	enum work: {"demand": 0,"supply": 1}
	enum progress: {"契約前": 0,"契約中": 1,"契約終了": 2}

	def image_should_be_presence
		errors.add(:image,:presence) unless image.attached?
	end

	def contract_status
		case self.progress
		when '契約前'
			self.progress = "契約中"
		when '契約中'
			self.prgress = "契約完了"
		end
		self.save
	end
end
