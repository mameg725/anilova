class Admin::UsersController < ApplicationController
  def top
  	@posts = Post.all.order("id DESC")
  end

  def index
  	@users = User.with_deleted.order("id DESC")
  end

  def show
  	@user = User.friendly.with_deleted.find(params[:id])
  end
end
