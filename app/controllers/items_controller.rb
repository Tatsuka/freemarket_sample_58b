class ItemsController < ApplicationController

  def index
    @ladies_items = Item.extract_by_category(1)
    @mens_items = Item.extract_by_category(2)
    @home_appliance_items = Item.extract_by_category(3)
    @toy_items = Item.extract_by_category(4)
  end

  def new
    # unless user_signed_in?
    #   redirect_to new_user_session_path
    # else
      @item =Item.new
    # end
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