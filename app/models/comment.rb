class Comment < ApplicationRecord
	include Discard::Model
  	default_scope -> { joins(:post).merge(Post.kept) }
	validates :detail,presence: true,length: {maximum: 50}
	belongs_to :user
	belongs_to :service
end
