require 'rails_helper'
describe "PostController" do
  before do
    @user1 = build(:user)
    @post1 = build(:post)
    @post2 = build(:post)
  end

  describe 'index' do
    context "index" do
      before do
        visit "posts"
      end
      it 'オススメタグの表記はあるか' do
       expect(page).to have_content "オススメタグ"
      end
    end
    context 'show' do
      it 'Post詳細画面が表示されるか' do
        visit "posts/#{@post1.id}"
      end
    end
  end
end
