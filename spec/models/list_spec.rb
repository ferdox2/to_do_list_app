require 'rails_helper'

RSpec.describe List, type: :model do

  context 'Create list' do
    it 'should creates a valid list' do
      expect(FactoryBot.create(:list)).to be_valid 
    end
  end
  
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:tasks).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:tittle) }
  end

end
