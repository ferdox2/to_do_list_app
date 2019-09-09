require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:lists).dependent(:destroy) }
    end

  context 'Create user' do
    it 'should creates a valid user' do
      expect(FactoryBot.create(:user)).to be_valid 
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

end
