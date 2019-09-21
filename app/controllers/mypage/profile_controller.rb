class Mypage::ProfileController < ApplicationController
  def edit
    @user = current_user
  end
end
