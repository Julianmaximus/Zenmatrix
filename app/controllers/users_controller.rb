class UsersController < ApplicationController
  def new
  end

  def create
  end

  def index
    @users = User.all
    current_user.avatar.attach(params[:avatar])
  end

  # Add more actions as needed
end
