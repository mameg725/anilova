class Public::UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
  end

  def mypage
    @me = current_user
    @post = Post.new
  end

  def edit
  end

  def favoindex
    @me = current_user
    @post = Post.new
    @user = User.friendly.find(params[:id])
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def update
  end

  def destroy
  end


end
