require 'rails_helper'

RSpec.describe "PostCommentモデルのテスト", type: :model do
  before do
    @post_comments = build(:post_comment)
  end

  describe 'バリデーションテスト' do
    context 'reactionカラム' do
      it '100文字以下であること' do
        @post_comments.reaction = Faker::Lorem.characters(number: 101)
        expect(@post_comments.valid?).to eq(false)
      end
    end
  end

  describe 'アソシエーション' do
    context 'Notice' do
      it '1:Nか' do
        expect(PostComment.reflect_on_association(:notices).macro).to eq :has_many
      end
    end
    context 'User' do
      it 'N:1か' do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Post' do
      it 'N:1か' do
        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end
