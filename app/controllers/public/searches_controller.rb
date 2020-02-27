# frozen_string_literal: true

class Public::SearchesController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @records = search_for(@model, @content)
  end

  def search_for(model, content)
    if model == 'users'
      User.where('name LIKE ?', '%' + content + '%')
    elsif model == 'posts'
      Post.where('murmur LIKE ?', '%' + content + '%')
    elsif model == "tags"
      ActsAsTaggableOn::Tag.where("name LIKE ?", '%' + content + '%')
    end
  end
end
