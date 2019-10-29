class Restaurant < ApplicationRecord
    has_many :foods, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :res_images, dependent: :destroy
    has_many :transactions

    scope :recent, -> { order(created_at: :desc) }
    scope :best, -> { order(vote_num: :desc) }
end
