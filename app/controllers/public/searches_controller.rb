class Public::SearchesController < ApplicationController
  def search
  	@model = params["search"]["model"]
    @content = params["search"]["content"]
    #@method = params["search"]["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'users'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        User.where('name LIKE ?', '%'+content)
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'posts'
      if method == 'perfect'
        Post.where(murmur: content)
      elsif method == 'forward'
        Post.where('murmur LIKE ?', content+'%')
      elsif method == 'backward'
        Post.where('murmur LIKE ?', '%'+content)
      else
        Post.where('murmur LIKE ?', '%'+content+'%')
      end
    end
  end
end
