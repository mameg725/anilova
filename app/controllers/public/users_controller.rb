class Public::UsersController < ApplicationController
  def show
  end

  def mypage
    @me = current_user
    @post = Post.new
  end

  def edit
  end

  def follower
  end

  def followed
  end

  def favoindex
  end

  def update
  end

  def destroy
  end


end
