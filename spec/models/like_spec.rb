# require 'rails_helper'

# RSpec.describe Like, type: :model do
#   describe 'Check Association' do
#     it 'belong to User' do
#       association = described_class.reflect_on_association('author')
#       expect(association.macro).to eq :belongs_to
#       expect(association.options[:foreign_key]).to eq 'author_id'
#     end

#     it 'belongs to Post' do
#       association = described_class.reflect_on_association('post')
#       expect(association.macro).to eq :belongs_to
#       expect(association.options[:foreign_key]).to eq 'post_id'
#     end
#   end

#   describe 'check like incrementation and decrementation' do
#     user = User.create(name: 'ibrahim', bio: 'I love to learn anything')
#     post = Post.create(author: user, title: 'Test ', text: 'Welcome to my learning land')
#     like = Like.new(author: user, post:)

#     it 'increase likes_counter after creatation of like' do
#       expect { like.save }.to change { post.likes_counter }.by(1)
#     end

#     it 'decrements likes_counter after destroy' do
#       expect { like.destroy }.to change { post.reload.likes_counter }.by(-1)
#     end
#   end
# end
