
class User < ActiveRecord::Base
  has_secure_password
  belongs_to :location
  has_many :trees
  has_many :comments
  # validates :username, presence: true
  # validates :email, presence: true
  # validates :password, length: { minimum: 3 }
end
