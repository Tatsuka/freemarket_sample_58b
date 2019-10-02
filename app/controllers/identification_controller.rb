class Mypage::IdentificationController < ApplicationController
  def edit
    @user = current_user
  end

  def update
  end
end
