
class Tree < ActiveRecord::Base
  has_many :comments
  belongs_to :user
end

# current_user.trees = this shows all the tree from the current logged in user
