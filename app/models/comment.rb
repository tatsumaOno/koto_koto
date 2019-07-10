class Comment < ApplicationRecord
	validates :detail,presence: true,length: {maximum: 100}

	belongs_to :user
	belongs_to :service
end
