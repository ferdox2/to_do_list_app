require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Associations' do
    it { should belong_to(:list)}
    end

  context 'Create task' do
    it 'should creates a valid task' do
      expect(FactoryBot.create(:task)).to be_valid 
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:tittle) }
    it { should validate_presence_of(:description) }
  end
end
