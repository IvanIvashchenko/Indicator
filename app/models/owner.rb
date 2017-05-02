class Owner < ApplicationRecord

  has_many :products
  has_secure_password

  mount_uploader :avatar, ImageUploader
  validates :shop, :avatar, presence: true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, length: { minimum: 8 }

end