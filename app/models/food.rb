class Food < ApplicationRecord
  belongs_to :restaurant
  has_many :food_images, dependent: :destroy
end
