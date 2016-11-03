
class Location < ActiveRecord::Base
  has_many :trees
  has_many :users
end
