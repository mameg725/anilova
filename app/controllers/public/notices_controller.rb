# frozen_string_literal: true

class Public::NoticesController < ApplicationController
  before_action :authenticate_user!
  def index
    @notice = Notice.where.not(visitor_id: current_user.id).order("id DESC")
  end
end
