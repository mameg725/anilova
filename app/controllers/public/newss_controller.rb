class Public::NewssController < ApplicationController
  def index #Infomation/お知らせ一覧
  	@messages = News.where(user_id: 1).order("id DESC")
  end

  def message #Message/運営からのメッセージ一覧
  	@messages = News.where(user_id: current_user.id).or(News.where(user_id: nil))
  end

  def show #お知らせ・運営からのメッセージ詳細
  	@news = News.find(params[:id])
  end
end
