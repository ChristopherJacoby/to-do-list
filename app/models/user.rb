class User < ApplicationRecord

  validates :name, presence: true
  has_secure_password
  validates :password, length: {minimum: 10, allow_blank:true }
  validates :email, email: true, uniqueness: {case_sensitive: false}

end
