
class User < ActiveRecord::Base
  has_secure_password
  belongs_to :location
  has_many :trees
  has_many :comments
end
