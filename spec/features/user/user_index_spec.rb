require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  before do
    @user1 = create(:user, :with_posts, photo: 'alice.jpg')
    @user2 = create(:user, :with_posts, photo: 'bob.jpg')
  end

  scenario 'I can see the username of all other users' do
    visit root_path
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'I can see the profile picture for each user' do
    visit root_path
    expect(page).to have_css("img[src*='alice.jpg']")
    expect(page).to have_css("img[src*='bob.jpg']")
  end

  scenario 'I can see the number of posts each user has written' do
    visit root_path
    expect(page).to have_content('Number Of Posts: 3', count: 2)
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    visit root_path

    click_link @user1.name
    expect(current_path).to eq(user_path(@user1))
  end
end
