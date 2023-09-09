class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  validates :name, presence: true
  validates :posts_counter, numericality: { integer: true, greater_than_or_equal_to: 0 }

  before_create :set_default_photo

  def set_default_photo
    self.photo = "https://randomuser.me/api/portraits/men/#{rand(1..100)}.jpg"
  end

  def recent_3posts
    posts.order(created_at: :desc).limit(3)
  end
end
