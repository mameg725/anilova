class Admin::MessagesController < ApplicationController
  def index
    @messages = News.where.not(user_id: 1)
    @message = News.new
  end

  def show
  	@user = User.friendly.with_deleted.find(params[:id])
  	@message = News.new
  end

  def create
  	@message = News.new(news_params)
  	@message.save!
    @notice = Notice.new
    @notice.visitor_id = 1
    @notice.visited_id = @message.user_id
    @notice.news_id = @message.id
    @notice.action = "news"
    @notice.save
  	redirect_to request.referer
  end

  private
  def news_params
  	params.require(:news).permit(:news_text, :title, :user_id)
  end
end
