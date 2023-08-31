require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user_id = 19
  post_id = 19
  describe 'GET /posts' do
    it 'returns a successful response' do
      get "/users/#{user_id}/posts"
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get "/users/#{user_id}/posts"
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user_id}/posts"
      expect(response.body).to include('Number of Posts')
    end
  end

  describe 'GET /posts/:id' do
    it 'returns a successful response' do
      get "/users/#{user_id}/posts/#{post_id}"
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get "/users/#{user_id}/posts/#{post_id}"
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user_id}/posts/#{post_id}"
      expect(response.body).to include('Number of Post')
    end
  end
end
