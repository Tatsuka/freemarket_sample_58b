class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @ladies_items = Item.extract_by_category(1)
    @mens_items = Item.extract_by_category(2)
    @home_appliance_items = Item.extract_by_category(3)
    @toy_items = Item.extract_by_category(4)
  end
  
  def new
    if user_signed_in?
      redirect_to new_user_login_session_path
    else
      @item = Item.new
      @item.images.build
    end
  end
  def create
    @item = Item.new(item_params)
      params[:images][:image].each do |i|
        @item.images.build(image: i, item_id: @item.id)
      end
      if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end
  
  def search
  end
  
  def show
    other_items = Item.where.not(id: params[:id])
    @user_items = other_items.where(user_id: @item.user.id).limit(6)
    @category_items = other_items.where(category_id: @item.category_id).limit(6)
  end
  
  def edit
  end
  
  def update
    item.update(item_params)
    redirect_to item_path(item.id)
  end
  
  def destroy
    if item.user_id == current_user.id
      @item.destroy
      redirect_to mypage_listings_listing_of_items_on_sale_path
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :detail,
      :shipping_cost,
      :shipping_fee_charge_to,
      :shipping_days,
      :condition_id,
      :category_id,
      :trade_status_id,
      :brand_id,
      :prefecture_id,
      images_attributes: [:image, :item_id]
    ).merge(user_id: 1)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
