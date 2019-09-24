class Mypage::ListingController < ApplicationController
  def update
    @user = current_user
  end
  def edit
    @user = current_user
  end
end
