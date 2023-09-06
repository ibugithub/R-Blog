require 'rails_helper'

RSpec.feature 'Post show page', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  let!(:comments) { create_list(:comment, 3, post: post, author: user) }

  before do
    create_list(:comment, 3, post:)
    create_list(:like, 2, post:)
  end

  scenario 'I can see the username of each commentor' do
    visit user_post_path(user, post)

    comments.each do |comment|
      expect(page).to have_content(comment.author.name) 
    end
  end

  scenario 'I can see the post body' do
    visit user_post_path(user, post)
    expect(page).to have_content(post.text)
  end

  scenario 'I can see the comment each commentor left' do
    visit user_post_path(user, post)
    post.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
