class Public::PostsController < ApplicationController
  def index
    @posts = Post.all.order("id DESC")
    @me = current_user
    if params[:tag_name]
      @posts = @posts.tagged_with("#{params[:tag_name]}")
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
    @post_comments = @post.post_comments
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  		if @post.save
  			redirect_to request.referer
  		else

  			redirect_to request.referer
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :murmur, :post_image, :tag_list)
  end
end
