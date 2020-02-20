class Admin::MessagesController < ApplicationController
  def index
    @messages = News.where(user_id: 1)
    @message = News.new
  end

  def show
  	@user = User.friendly.find(params[:id])
  	@message = News.new
  end

  def create
  	@message = News.new(news_params)
  	@message.save!
  	redirect_to request.referer
  end

  private
  def news_params
  	params.require(:news).permit(:news_text, :title, :user_id)
  end
end
