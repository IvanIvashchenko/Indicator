class User < ApplicationRecord

  devise :database_authenticatable, :registerable #,:recoverable, :rememberable, :trackable, :validatable, :async

  has_many :products
  validates :password, :name, presence: true
  validates :email, :presence => true, :uniqueness => true
end
