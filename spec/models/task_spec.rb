require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'Associations' do
    it 'belongs_to list' do
      association = described_class.reflect_on_association(:list).macro
      expect(association).to eq :belongs_to
    end
  end
end
