class UsersController < ApplicationController
  def new
  end

  def create
  end

  def index
    @users = User.all
  end


  # Add more actions as needed
end
