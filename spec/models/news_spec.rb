require 'rails_helper'

RSpec.describe "Newsモデルのテスト", type: :model do
  before do
    @news = build(:news)
  end
  describe 'バリデーションテスト' do
    context 'titleカラム' do
      it 'titleが空だとNG' do
        @news.title = ''
        # is_expected.to eq false;
        expect(@news.valid?).to eq(false)
      end
      it '10文字以上であること' do
        @news.title = Faker::Lorem.characters(number: 9)
        expect(@news.valid?).to eq(false)
      end
      it '20文字以下であること' do
        @news.title = Faker::Lorem.characters(number: 21)
        expect(@news.valid?).to eq(false)
      end
    end
    context 'news_textカラム' do
      it 'news_textが空だとNG' do
        @news.news_text = ''
        # is_expected.to eq false;
        expect(@news.valid?).to eq(false)
      end
      it '10文字以上であること' do
        @news.news_text = Faker::Lorem.characters(number: 9)
        expect(@news.valid?).to eq(false)
      end
      it '1000文字以下であること' do
        @news.news_text = Faker::Lorem.characters(number: 1001)
        expect(@news.valid?).to eq(false)
      end
    end
  end

  describe 'アソシエーション' do
    context 'Notice' do
      it '1:Nか' do
        expect(News.reflect_on_association(:notices).macro).to eq :has_many
      end
    end
    context 'User' do
      it 'N:1か' do
        expect(News.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
