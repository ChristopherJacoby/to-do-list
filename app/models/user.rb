class User < ApplicationRecord

  validates :name, presence: true
  has_secure_password
  validates :email, email: true, uniqueness: {case_sensitive: false}

end
