class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :like

  def recent_5comments
    comment.order(created_at: :desc).limit(5)
  end

  after_create :increment_post_counter

  private
  def increment_post_counter
    author.increment(:posts_counter).save
  end
end
