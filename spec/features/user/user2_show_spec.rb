require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  let(:user) { create(:user, :with_posts) }

  scenario 'I can see a button that lets me view all of a user\'s posts' do
    visit user_path(user)
    expect(page).to have_link('View All Posts', href: user_posts_path(user))
  end

  scenario 'When I click a user\'s post, it redirects me to that post\'s show page' do
    post = user.posts.first
    visit user_path(user)
    click_link post.title
    expect(current_path).to eq(user_post_path(user, post))
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post index page' do
    visit user_path(user)
    click_link 'View All Posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
