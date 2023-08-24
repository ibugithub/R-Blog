class User < ApplicationRecord
  has_many :post
  has_many :like
  has_many :comment

  def recent_3posts
    posts.order(created_at: :desc).limit(3)
  end
end
