
class User < ActiveRecord::Base
  has_secure_password
  has_many :trees
  has_many :comments
end
