require 'rails_helper'

describe 'ユーザーテスト' do
  describe '新規登録' do
    before do
      visit "/users/sign_up"
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功' do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'user[friendly_url]', with: Faker::Lorem.characters(number: 5)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button 'Sign up'
      end
      it '新規登録に失敗する' do
        fill_in 'user[name]', with: ''
        fill_in 'user[friendly_url]', with: ''
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        click_button 'Sign up'
      end
    end
  end

  describe 'ログイン画面' do
    before do
      visit "/users/sign_in"
      @user = build(:user)
    end
    context 'ログイン画面に遷移' do
      it 'ログインに成功' do
        fill_in 'user[friendly_url]', with: @user.friendly_url
        fill_in 'user[password]', with: @user.password
        click_button 'Log in'
      end
      it 'ログインに失敗する' do
        fill_in 'user[friendly_url]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'Log in'
      end
    end
  end
end