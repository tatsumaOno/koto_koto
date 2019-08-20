class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :recent, ->(num) { order(created_at: :desc).limit(num) }
end
