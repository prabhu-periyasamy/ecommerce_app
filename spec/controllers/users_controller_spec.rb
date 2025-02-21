# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'GET #index' do
    it 'should return 200 response' do
      get :index
      expect(assigns(:month)).to eq("feb")
      expect(response).to have_http_status(200)
    end
  end
end
