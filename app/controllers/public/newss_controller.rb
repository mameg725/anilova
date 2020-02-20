class Public::NewssController < ApplicationController
  def index
  	@messages = News.where(user_id: 1)
  end

  def message
  	@messages = News.where(user_id: current_user.id).or(News.where(user_id: nil))
  end

  def show
  end
end
