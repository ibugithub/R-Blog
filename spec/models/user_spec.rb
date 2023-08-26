require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Check Association' do
    it ' has  many posts' do
      association = described_class.reflect_on_association('posts')
      expect(association.macro).to eq :has_many
      expect(association.options[:foreign_key]).to eq 'author_id'
    end

    it 'has many likes' do
      association = described_class.reflect_on_association('likes')
      expect(association.macro).to eq :has_many
      expect(association.options[:foreign_key]).to eq 'author_id'
    end

    it 'has many comments' do
      association = described_class.reflect_on_association('comments')
      expect(association.macro).to eq :has_many
      expect(association.options[:foreign_key]).to eq 'author_id'
    end
  end

  describe 'validations' do
    it 'is valid with name' do
      user = described_class.create(name: 'user', bio: 'hello world', posts_counter: 1)
      expect(user).to be_valid
    end
    it 'is not valid without name' do
      user = described_class.create(name: nil)
      expect(user).not_to be_valid
    end
  end

  describe '#recent_posts' do
    it 'returns 3 recent posts' do
      user = User.create(name: 'ibu', bio: 'Welcome to ibus land')
      Post.create(title: 'Post 1', text: 'Text 1', author: user)
      Post.create(title: 'Post 2', text: 'Text 2', author: user)
      Post.create(title: 'Post 3', text: 'Text 3', author: user)
      Post.create(title: 'Post 4', text: 'Text 4', author: user)

      recent_posts = user.recent_3posts
      expect(recent_posts.count).to eq(3)
    end
  end
end
