class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_create :increment_like_counter
  before_destroy :decrement_like_counter

  private

  def increment_like_counter
    post.increment!(:likes_counter)
  end

  def decrement_like_counter
    post.decrement!(:likes_counter)
  end
end
