class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  scope :recent, -> { order(created_at: :desc) }
end
