# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  before_action :authenticate_owner!
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
