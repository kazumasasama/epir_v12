class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :password, presence: true
  validates :memo, length: { maximum: 3000 }
  validates :customer_note, length: { maximum: 3000 }
end
