class Public::NoticesController < ApplicationController
  def index
  	@notice = current_user.passive_notice.all
  	@notice.where(checked: false).each do |notice|
  		notice.update_attributes(checked: true)
  	end
  end
end
