require 'rails_helper'

RSpec.describe List, type: :model do
 context 'Associations' do
    it 'belongs_to user' do
      association = described_class.reflect_on_association(:user).macro
      expect(association).to eq :belongs_to
    end

    it 'has_many tasks' do
      association = described_class.reflect_on_association(:tasks)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :destroy
    end
  end
end
