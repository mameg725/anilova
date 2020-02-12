class Public::PostsController < ApplicationController
  def index
  end

  def show
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  		if @post.save
  			redirect_to @book
  		else
  			render "/public/users/mypage"
      end
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:murmur, :tag_list)
  end
end
