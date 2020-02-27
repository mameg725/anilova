require 'rails_helper'

RSpec.describe "Relationshipモデルのテスト", type: :model do
  before do
    @relationship = build(:relationship)
  end

  describe 'アソシエーション' do
    context 'Follower' do
      it 'N:1か' do
        expect(Relationship.reflect_on_association(:follower).macro).to eq :belongs_to
      end
    end
    context 'Followed' do
      it 'N:1か' do
        expect(Relationship.reflect_on_association(:followed).macro).to eq :belongs_to
      end
    end
  end
end
