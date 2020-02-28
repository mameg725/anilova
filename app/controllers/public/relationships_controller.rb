# frozen_string_literal: true

class Public::RelationshipsController < ApplicationController
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

end
