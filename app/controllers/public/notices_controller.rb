class Public::NoticesController < ApplicationController
  def index
  	@notice = Notice.where.not(visitor_id: current_user.id).order("id DESC")
  end
end
