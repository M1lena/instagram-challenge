# new
class Like < ActiveRecord::Base
  validates :user, uniqueness:
    { scope: :post, notice: 'has liked this post already' }
  belongs_to :user
  belongs_to :post
end
