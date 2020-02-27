# frozen_string_literal: true

class Admin::PostsController < ApplicationController
  before_action :authenticate_owner!
  def index
    @posts = Post.all.order("id DESC")
    @posts = @posts.tagged_with(params[:tag_name].to_s) if params[:tag_name]
  end

  def show
    @user = User.friendly.find(params[:id])
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments
  end
end
