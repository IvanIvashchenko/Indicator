class Bundle < ApplicationRecord
  has_and_belongs_to_many :products

  validates :name, :price, presence: true
end
