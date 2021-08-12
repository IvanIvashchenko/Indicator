class User < ApplicationRecord

  # roles constant array
  ROLES = %w[admin owner guest].freeze

  validates :email, presence: true, uniqueness: true

  def role=(role_name)
    @role = role_name
    # case role_name
    # when 'admin'
    #   self.role = 'admin'
    # when 'owner'
    #   self.role = 'owner'
    # else
    #   # raise some exception
    # end
  end

  def role
    @role
  end
end
