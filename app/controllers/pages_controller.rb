  class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
  end

  def profile
    @user = current_user
    Profile.async_call(@user)
    redirect_to root_path
  end

end
