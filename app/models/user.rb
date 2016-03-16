class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, length: { maximum: 255 } ,uniqueness: true
  has_one :winner, dependent: :destroy
end
