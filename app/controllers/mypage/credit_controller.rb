class Mypage::CreditController < ApplicationController
  def index
    @user = current_user
  end
  def new
    @user = current_user
  end
  def create
    @user = current_user
  end
  def destroy
    @user = current_user
  end
end

