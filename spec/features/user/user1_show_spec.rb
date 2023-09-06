require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  let(:user) { create(:user, :with_posts) }

  scenario 'I can see the user\'s profile picture' do
    visit user_path(user)
    expect(page).to have_css("img[src*='#{user.photo}']")
  end

  scenario 'I can see the number of posts the user has written' do
    visit user_path(user)
    expect(page).to have_css('.user-header p', text: /Number Of Posts:\s*#{user.posts_counter}/i)
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
end
