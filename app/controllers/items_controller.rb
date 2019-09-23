class ItemsController < ApplicationController
  def index
  end
  def new
  end
  def create
  end
  def search
  end
  def show
    @item = Item.find(params[:id])
    other_items = Item.where.not(id: params[:id])
    @user_items = other_items.where(user_id: @item.user.id).limit(6)
    @category_items = other_items.where(category_id: @item.category.id).limit(6)
  end
  def edit
  end
  def update
  end
  def destroy
  end
end