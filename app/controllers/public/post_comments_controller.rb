# frozen_string_literal: true

class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    if @post_comment.save
      @post.created_notice_comment!(current_user, @post_comment.id)
      redirect_to request.referer
    else
      redirect_to request.referer, notice: "コメントの投稿に失敗しました。"
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:post_id])
    @post_comment.destroy
    redirect_to request.referer
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:reaction)
  end
end
