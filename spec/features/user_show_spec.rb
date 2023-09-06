require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  let(:user) { create(:user, :with_posts) }

  scenario 'I can see the user\'s profile picture' do
    visit user_path(user)
    expect(page).to have_css("img[src*='#{user.photo}']")
  end

  scenario 'I can see the user\'s username' do
    visit user_path(user)
    expect(page).to have_content(user.name)
  end

  scenario 'I can see the number of posts the user has written' do
    visit user_path(user)
    expect(page).to have_content("Number Of Posts: #{user.posts.count}")
  end

  scenario 'I can see the user\'s bio' do
    visit user_path(user)
    expect(page).to have_content(user.bio)
  end

  scenario 'I can see the user\'s first 3 posts' do
    visit user_path(user)
    user.posts.first(3).each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end

  scenario 'I can see a button that lets me view all of a user\'s posts' do
    visit user_path(user)
    expect(page).to have_link('View All Posts', href: user_posts_path(user))
  end

  scenario 'When I click a user\'s post, it redirects me to that post\'s show page' do
    post = user.posts.first
    visit user_path(user)
    click_link post.title
    expect(current_path).to eq(post_path(post))
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post index page' do
    visit user_path(user)
    click_link 'View All Posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
