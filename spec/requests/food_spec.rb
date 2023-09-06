require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Mark', email: 'mark@gmail.com', password: 'password123') }
  let(:food) { user.foods.create(name: 'chicken', user_id: user.id, price: 5, measurement_unit: 'kg', quantity: 4) }

  describe 'GET /index' do
    it 'checks if path is okay' do
      get foods_path
      expect(response).to have_http_status(302)
    end

    it 'responds well to html' do
      sign_in user
      get foods_path
      expect(response.content_type).to include 'text/html'
    end

    it 'redirects to sign-in page when not signed in' do
      get new_food_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
