require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { create(:user) }
  let(:list) { create(:list, user_id: user.id) }
  let(:task) { create(:task, list_id: list.id) }
  before { sign_in user }

  describe 'GET tasks#index ' do
    it 'with sign in user returns http success' do
      get :index
      expect(response).to redirect_to list_tasks_path
    end

    it 'without sign in user redirect to sign_in page' do
      sign_out user
      get :index
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete a task' do
      sign_in user
      delete :destroy, params: { list_id: list.id, id: task.id }
      expect(response).to redirect_to have_http_status(302)
    end
  end

  describe 'POST #create' do
    it 'should create a task' do
      sign_in user
      expect(FactoryBot.create(:task)).to be_valid
    end
  end


  describe 'GET #update' do
    it 'should update a task' do
      get :edit, params: { id: list.id, task: { id: task.id, tittle: task.tittle } }
      expect(response).to have_http_status(:success)
    end
  end
end