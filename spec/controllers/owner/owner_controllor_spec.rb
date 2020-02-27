require 'rails_helper'

describe 'ユーザーテスト' do
  describe 'ログイン画面' do
    before do
      visit "/owners/sign_in"
      @owner = build(:owner)
    end
    context 'ログイン画面に遷移' do
      it 'ログインに成功' do
        fill_in 'owner[email]', with: @owner.email
        fill_in 'owner[password]', with: @owner.password
        click_button 'Log in'
      end
      it 'ログインに失敗する' do
        fill_in 'owner[email]', with: ''
        fill_in 'owner[password]', with: ''
        click_button 'Log in'
      end
    end
  end
end