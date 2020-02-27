# frozen_string_literal: true

class Admin::NewssController < ApplicationController
  before_action :authenticate_owner!
  def index
    @message = News.new
  end

  def show
    @news = News.find(params[:id])
  end
end
