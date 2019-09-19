class Mypage::LogoutController < ApplicationController
  def index
    @user = current_user
  end
end
