class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :description, :title, presence: true
  # validates :image, file_size: {:maximum => 5.0.megabytes.to_i}
end
