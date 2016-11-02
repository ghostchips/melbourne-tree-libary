
class Tree < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :location
end

# current_user.trees = this shows all the tree from the current logged in user
