class Mypage::MypageController < ApplicationController
  def index
    @user = current_user
  end
end
