require 'rails_helper'

RSpec.feature 'Post show page', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  before do
    create_list(:comment, 3, post:)
    create_list(:like, 2, post:)
  end

  scenario 'I can see the post\'s title' do
    visit user_post_path(user, post)
    expect(page).to have_content(post.title)
  end

  scenario 'I can see who wrote the post' do
    visit user_post_path(user, post)
    expect(page).to have_content(user.name)
  end

  scenario 'I can see how many comments it has' do
    visit user_post_path(user, post)
    expect(page).to have_content("Comments: #{post.comments.count}")
  end

  scenario 'I can see how many likes it has' do
    visit user_post_path(user, post)
    expect(page).to have_content("Likes: #{post.likes.count}")
  end
end
