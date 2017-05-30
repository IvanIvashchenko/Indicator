class Product < ApplicationRecord
  has_and_belongs_to_many :bundles

  mount_uploader :image, ImageUploader
  validates :description, :title, presence: true
  # validates :image, file_size: {:maximum => 5.0.megabytes.to_i}
end
