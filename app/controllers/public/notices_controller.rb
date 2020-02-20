class Public::NoticesController < ApplicationController
  def index
  	@notice = current_user.passive_notice.all
  end
end
