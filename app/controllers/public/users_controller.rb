# frozen_string_literal: true

class Public::UsersController < ApplicationController
  before_action :login_user, only: %i[edit update mypage create]
  def show
    @user = User.friendly.find(params[:id])
  end

  def mypage
    @post = Post.new
    @user = User.friendly.find(params[:id])
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def favoindex
    @me = current_user
    @post = Post.new
    @user = User.friendly.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end

  def followpost
    @me = User.friendly.find(params[:id])
    @post = Post.new
    @user = User.friendly.find(params[:id])
    @follows = @user.following_user
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update(user_params)
      redirect_to users_mypage_path(current_user.friendly_id)
    else
      redirect_to request.referer, notice: "編集に失敗しました。"
    end
  end

  def destroy
    @user = User.friendly.find(params[:id])
    @user.destroy
    redirect_to "/"
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon_image, :introduction, :website, :friendly_id)
  end

  def login_user
    @user = User.friendly.find(params[:id])
    redirect_to "/" unless @user.id == current_user.id
  end
end
