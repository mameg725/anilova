class Public::UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
  end

  def mypage #Mypage/マイページ/自分の投稿を表示
    @post = Post.new
  end

  def edit #ユーザー情報の変更画面
    @user = User.friendly.find(params[:id])
  end

  def favoindex #FavoritePost/いいねした投稿の表示
    @me = current_user
    @post = Post.new
    @user = User.friendly.find(params[:id])
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def followpost #FollowPost/フォローした人の投稿一覧
    @me = User.friendly.find(params[:id])
    @post = Post.new
    @user = User.friendly.find(params[:id])
    @follows = @user.following_user

  end

  def update #ユーザー情報の更新
    @user = User.friendly.find(params[:id])
    @user.update(user_params)
    redirect_to users_mypage_path(current_user.friendly_id)
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


end
