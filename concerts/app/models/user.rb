class User < ApplicationRecord
  has_many :tickets
  has_many :concerts,through: :tickets
  has_secure_password
  validates :username, presence: true, uniqueness: true
  #validates :email, presence: true, uniqueness: true
  #validates :age, presence: true
  validates :password, presence: true

end
