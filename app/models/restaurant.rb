class Restaurant < ApplicationRecord
    has_many :foods, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :res_images, dependent: :destroy
    accepts_nested_attributes_for :res_images
    has_many :transactions

    scope :has_deadline, -> {where "deadline > '#{Time.now}'"}
    scope :recent, -> { order(created_at: :desc) }
    scope :asc, -> { order(name: :asc) }
    scope :best, -> { order(vote_num: :desc) }
end
