class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :increment_comment_counter

  private

  def increment_comment_counter
    post.increment(:comments_counter)
  end
end
