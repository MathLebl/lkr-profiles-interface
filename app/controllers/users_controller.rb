class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :user_password )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
