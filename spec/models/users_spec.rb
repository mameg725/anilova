require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do
  before do
    @user = build(:user)
  end

  describe 'バリデーションテスト' do
    context 'nameカラム' do
      it 'nameが空だとNG' do
        @user.name = ''
        # is_expected.to eq false;
        expect(@user.valid?).to eq(false)
      end
      it '1文字以上であること' do
        @user.name = Faker::Lorem.characters(number: 0)
        expect(@user.valid?).to eq(false)
      end
      it '10文字以下であること' do
        @user.name = Faker::Lorem.characters(number: 11)
        expect(@user.valid?).to eq(false)
      end
    end

    context 'friendly_urlカラム' do
      it 'friendly_urlが空だとNG' do
        @user.friendly_url = ''
        expect(@user.valid?).to eq(false)
      end
      it '3文字以上であること' do
        @user.friendly_url = Faker::Lorem.characters(number: 0)
        expect(@user.valid?).to eq(false)
      end
      it '10文字以下であること' do
        @user.friendly_url = Faker::Lorem.characters(number: 11)
        expect(@user.valid?).to eq(false)
      end
    end

    context 'introductionカラム' do
      it '100文字以下であること' do
        @user.introduction = Faker::Lorem.characters(number: 101)
        expect(@user.valid?).to eq(false)
      end
    end
  end

  describe 'アソシエーション' do
    context 'Post' do
      it '1:Nか' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
    context 'PostComment' do
      it '1:Nか' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'Favorite' do
      it '1:Nか' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'News' do
      it '1:Nか' do
        expect(User.reflect_on_association(:news).macro).to eq :has_many
      end
    end
  end
end
