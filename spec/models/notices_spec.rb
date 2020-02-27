require 'rails_helper'

RSpec.describe "Noticeモデルのテスト", type: :model do
  before do
    @notices = build(:notice)
  end

  describe 'アソシエーション' do
    context 'User' do
      it 'N:1か' do
        expect(Notice.reflect_on_association(:visitor).macro).to eq :belongs_to
        expect(Notice.reflect_on_association(:visited).macro).to eq :belongs_to
      end
    end
    context 'Post' do
      it 'N:1か' do
        expect(Notice.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
    context 'PostComment' do
      it 'N:1か' do
        expect(Notice.reflect_on_association(:post_comment).macro).to eq :belongs_to
      end
    end
    context 'News' do
      it 'N:1か' do
        expect(Notice.reflect_on_association(:news).macro).to eq :belongs_to
      end
    end
  end
end
