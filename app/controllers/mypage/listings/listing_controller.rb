class Mypage::Listings::ListingController < ApplicationController
  def index
    @user = current_user
    @item = Item.where(user_id: @user.id).limit(15)
  end

  def update
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end
end
