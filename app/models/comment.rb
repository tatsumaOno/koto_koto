class Comment < ApplicationRecord
	validates :detail,presence: true,length: {maximum: 50}
	belongs_to :user
	belongs_to :service

	include Discard::Model
  	default_scope -> { joins(:user).merge(User.kept) }
end
