# frozen_string_literal: true

class Public::NewssController < ApplicationController
  before_action :login_user, only: [:message]
  def index
    @messages = News.where(user_id: 1).order("id DESC")
  end

  def message
    @messages = News.where(user_id: current_user.id).or(News.where(user_id: nil))
  end

  def show
    @news = News.find(params[:id])
  end

  private

  def login_user
    @user = User.friendly.find(params[:id])
    redirect_to "/" unless @user.id == current_user.id
  end
end
