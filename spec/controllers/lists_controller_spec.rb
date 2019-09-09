require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:user) { create(:user) }
  let(:list) { create(:list, user_id: user.id) }
  
  before { sign_in user }

  describe 'GET #index ' do
    it 'with sign in user returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'without sign in user redirect to sign_in page' do
      sign_out user
      get :index
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete a list' do
      sign_in user
      delete :destroy, params: { id: list.id }
      expect(response).to redirect_to '/lists'
    end
  end

  describe 'POST #create' do
    it 'should create a list' do
      sign_in user
      expect(FactoryBot.create(:list)).to be_valid
    end
  end


  describe 'GET #update' do
    it 'should update a list' do
      get :edit, params: { id: list.id, list: { tittle: list.tittle } }
      expect(response).to have_http_status(:success)
    end
  end
end