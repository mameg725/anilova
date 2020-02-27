require 'rails_helper'

RSpec.describe "Postモデルのテスト", type: :model do
  before do
    @post = build(:post)
  end

  describe 'バリデーションテスト' do
    context 'murmurカラム' do
      it '200文字以下であること' do
        @post.murmur = Faker::Lorem.characters(number: 201)
        expect(@post.valid?).to eq(false)
      end
    end
  end

  describe 'アソシエーション' do
    context 'PostComment' do
      it '1:Nか' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'Favorite' do
      it '1:Nか' do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Notice' do
      it '1:Nか' do
        expect(Post.reflect_on_association(:notices).macro).to eq :has_many
      end
    end

    context 'User' do
      it 'N:1か' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
