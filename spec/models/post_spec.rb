# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   describe 'Check Association' do
#     it ' belongs to' do
#       association = described_class.reflect_on_association('author')
#       expect(association.macro).to eq :belongs_to
#       expect(association.options[:foreign_key]).to eq 'author_id'
#     end

#     it 'has many likes' do
#       association = described_class.reflect_on_association('likes')
#       expect(association.macro).to eq :has_many
#       expect(association.options[:foreign_key]).to eq 'post_id'
#     end

#     it 'has many comments' do
#       association = described_class.reflect_on_association('comments')
#       expect(association.macro).to eq :has_many
#       expect(association.options[:foreign_key]).to eq 'post_id'
#     end
#   end

#   describe 'validations' do
#     it 'should be a valid post' do
#       user = User.create(name: 'ibu', bio: 'ibus bio', posts_counter: 0)
#       post = user.posts.build(title: 'ibus title ', text: 'ibus text', comments_counter: 0, likes_counter: 0)
#       expect(post).to be_valid
#     end
#     it 'should not be a valid post' do
#       user = User.create(name: 'ibu2', bio: 'ibus bio2', posts_counter: 0)
#       post = user.posts.build(title: '', text: '', comments_counter: 0, likes_counter: 0)
#       expect(post).not_to be_valid
#     end
#     it 'validates comments_counter numericality' do
#       post = described_class.new(comments_counter: 'abc')
#       expect(post).not_to be_valid
#     end
#   end

#   describe 'post incrementation' do
#     user = User.create(name: 'ibrahim', bio: 'I love to learn anything')
#     post = Post.new(author: user, title: 'Test ', text: 'Welcome to my learning land')

#     it 'will increment the post counter' do
#       expect { post.save }.to change { user.posts_counter }.by(1)
#     end

#     it 'will decrement the post counter' do
#       expect { post.destroy }.to change { user.posts_counter }.by(-1)
#     end
#   end

#   describe 'Show 5 recent comments' do
#     it 'will show 5 recent comments' do
#       user = User.create(name: 'ibu', bio: 'I am a knowledge hunger')
#       post = Post.create(title: 'title 1', text: '5ext 1', author: user)
#       Comment.create(author: user, post:)
#       Comment.create(author: user, post:)
#       Comment.create(author: user, post:)
#       Comment.create(author: user, post:)
#       Comment.create(author: user, post:)
#       Comment.create(author: user, post:)
#       Comment.create(author: user, post:)

#       recent_comments = post.recent_5comments
#       expect(recent_comments.count).to eq(5)
#     end
#   end
# end
