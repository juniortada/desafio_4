require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe 'GET #show' do
    it 'return json success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
