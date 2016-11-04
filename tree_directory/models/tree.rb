
class Tree < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :location
  # validates :name, presence: true
  # validates :image_url, presence: true
  # validates :description, presence: true
  # validates :location_id, presence: true
  # validates :user_id, presence: true
end

# current_user.trees = this shows all the tree from the current logged in user
