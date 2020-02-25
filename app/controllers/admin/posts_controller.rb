class Admin::PostsController < ApplicationController
  def index
  	@posts = Post.all.order("id DESC")
  	if params[:tag_name]
      @posts = @posts.tagged_with("#{params[:tag_name]}")
    end
  end

  def show
  	@user = User.friendly.find(params[:id])
  	@post = Post.find(params[:id])
  	@post_comments = @post.post_comments
  end
end
