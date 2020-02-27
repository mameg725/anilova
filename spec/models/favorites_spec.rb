require 'rails_helper'

RSpec.describe "Newsモデルのテスト", type: :model do
  before do
    @news = build(:news)
  end

  describe 'アソシエーション' do
    context 'User' do
      it 'N:1か' do
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Post' do
      it 'N:1か' do
        expect(Favorite.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end
