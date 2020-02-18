class Public::UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
  end

  def mypage
    @post = Post.new
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def favoindex
    @me = current_user
    @post = Post.new
    @user = User.friendly.find(params[:id])
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def update
    @user = User.friendly.find(params[:id])
    @user.update(user_params)
    binding.pry
    redirect_to users_mypage_path(current_user.friendly_id)
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :icon_image, :introduction, :website, :friendly_id)
  end


end
