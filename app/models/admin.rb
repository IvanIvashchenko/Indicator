class Admin < ApplicationRecord
  has_secure_password

  mount_uploader :avatar, ImageUploader
  mount_uploader :photo, ImageUploader
  validates :firstname, :lastname, :birth_date, :avatar, :photo, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 10 }
end
