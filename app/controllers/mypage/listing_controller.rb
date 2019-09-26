class Mypage::ListingController < ApplicationController
  def index
    @user = current_user
  end
  def update
    @user = current_user
  end
  def edit
    @user = current_user
  end
  def show
    @item = Item.find(params[:id])
  end
end
