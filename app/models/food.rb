class Food < ApplicationRecord
  belongs_to :restaurant
  mount_uploader :image, FoodImageUploader
end
