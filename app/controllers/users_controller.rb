class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # PATCH/PUT /users/1
  def update
    if current_user.update(user_params)
      current_user.avatar.attach(params[:avatar]) if params[:avatar].present?
      redirect_to current_user, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :title, :bio, :avatar)
  end
end
