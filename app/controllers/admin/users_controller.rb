class Admin::UsersController < ApplicationController
  def top
  end

  def index
  end

  def show
  	@user = User.friendly.find(params[:id])
  end
end
