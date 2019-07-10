class Comment < ApplicationRecord
	validates :detail,presence: true,length: {maximum: 50}
	belongs_to :user
	belongs_to :service
	acts_as_paranoid
end
