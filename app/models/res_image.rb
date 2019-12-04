class ResImage < ApplicationRecord
  belongs_to :restaurant
  mount_uploader :image, FoodImageUploader
end
