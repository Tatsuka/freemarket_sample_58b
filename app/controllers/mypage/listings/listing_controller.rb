class Mypage::Listings::ListingController < ApplicationController
  def index
    @item = Item.find(params[:id])
  end

  def update
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end
end
