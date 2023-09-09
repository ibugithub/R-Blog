# require 'rails_helper'

# RSpec.describe Comment, type: :model do
#   describe ' Associations' do
#     it 'belongs to author' do
#       association = described_class.reflect_on_association('author')
#       expect(association.macro).to eq :belongs_to
#       expect(association.options[:foreign_key]).to eq 'author_id'
#     end

#     it 'belongs to post' do
#       association = described_class.reflect_on_association('post')
#       expect(association.macro).to eq :belongs_to
#       expect(association.options[:foreign_key]).to eq 'post_id'
#     end
#   end

#   describe 'After create and before destroy' do
#     user = User.create(name: 'ibrahim', bio: 'I love to learn anything')
#     post = Post.create(author: user, title: 'Test ', text: 'Welcome to my learning land')
#     comment = Comment.new(author: user, post:)

#     it 'will increment comment counter after creation' do
#       expect { comment.save }.to change { post.comments_counter }.by(1)
#     end

#     it 'will decrement comment counter before destroying' do
#       expect { comment.destroy }.to change { post.comments_counter }.by(-1)
#     end
#   end
# end
