require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'Test User') }
  let(:post) { user.posts.create(title: 'Test Post') }

  describe 'GET /users/:user_id/posts' do
    it 'returns a successful response' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('Number of Posts')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'returns a successful response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Number of Post')
    end
  end
end
