require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  let(:user) { create(:user, :with_posts) }
  let(:post) { user.posts.first }

  scenario 'I can see a post\'s title' do
    visit user_posts_path(user)
    expect(page).to have_content(post.title)
  end

  scenario 'I can see some of the post\'s body' do
    visit user_posts_path(user)
    expect(page).to have_content(post.text.truncate(100))
  end

  scenario 'I can see how many likes a post has' do
    create(:like, post:)
    visit user_posts_path(user)
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    create_list(:post, 10, author: user)
    visit user_posts_path(user)
    expect(page).to have_css('.pagination')
  end

  scenario 'When I click on a post, it redirects me to that post\'s show page' do
    visit user_posts_path(user)
    click_link post.title
    expect(current_path).to eq(user_post_path(user, post))
  end
end
