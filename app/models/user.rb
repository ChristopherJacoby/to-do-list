class User < ApplicationRecord

  validates :name, :username, presence: true, uniqueness: {case_sensitive: false }
  has_secure_password
  validates :email, email: true, uniqueness: {case_sensitive: false}

end
