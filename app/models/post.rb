class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_5comments
    comments.order(created_at: :desc).limit(5)
  end

  after_create :increment_post_counter
  before_destroy :decrement_post_counter

  private

  def increment_post_counter
    author.increment!(:posts_counter).save
  end

  def decrement_post_counter
    author.decrement!(:posts_counter)
  end
end
