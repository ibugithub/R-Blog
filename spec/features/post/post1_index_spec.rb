require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  let(:user) { create(:user, :with_posts) }
  let(:post) { user.posts.first }

  scenario 'I can see the user\'s profile picture' do
    visit user_posts_path(user)
    expect(page).to have_css("img[src*='#{user.photo}']")
  end

  scenario 'I can see the user\'s username' do
    visit user_posts_path(user)
    expect(page).to have_content(user.name)
  end

  scenario 'I can see the number of posts the user has written' do
    visit user_posts_path(user)
    expect(page).to have_css('.user-header p', text: /Number Of Posts:\s*#{user.posts_counter}/i)
  end

  scenario 'I can see a post\'s title' do
    visit user_posts_path(user)
    expect(page).to have_content(post.title)
  end

  scenario 'I can see the first comments on a post' do
    post = create(:post, :with_comments, author: user) # Create a post with comments
    visit user_posts_path(user)

    within('.post', text: post.title) do
      post.comments.first(3).each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
