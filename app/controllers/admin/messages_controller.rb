# frozen_string_literal: true

class Admin::MessagesController < ApplicationController
  before_action :authenticate_owner!
  def index
    @messages = News.where.not(user_id: 1)
    @message = News.new
  end

  def show
    @user = User.friendly.with_deleted.find(params[:id])
    @messages = @user.news.all
    @message = News.new
  end

  def create
    @message = News.new(news_params)
    if @message.save
      @notice = Notice.new
      @notice.visitor_id = 1
      @notice.visited_id = @message.user_id
      @notice.news_id = @message.id
      @notice.action = "news"
      @notice.save
    else
      redirect_to request.referer, notice: "メッセージの作成に失敗しました。"
    end
  end

  private

  def news_params
    params.require(:news).permit(:news_text, :title, :user_id)
  end
end
