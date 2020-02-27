# frozen_string_literal: true

class Public::RelationshipsController < ApplicationController
  before_action :login_user, only: %i[create destroy]
  def create
    current_user.follow(params[:user_id]).created_notice_follow!(current_user, params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def follower
    @user = User.friendly.find(params[:user_id])
    @users = @user.following_user
  end

  def followed
    @user = User.friendly.find(params[:user_id])
    @users = @user.follower_user
  end

  private
    def login_user
      @user = User.friendly.find(params[:id])
      redirect_to "/" unless @user.id == current_user.id
    end
  end
end
