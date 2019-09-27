class ItemsController < ApplicationController

  def index
    @ladies_items = Item.extract_by_category(1)
    @mens_items = Item.extract_by_category(2)
    @home_appliance_items = Item.extract_by_category(3)
    @toy_items = Item.extract_by_category(4)
  end

  def new
    # ユーザー登録機能実装後に使用
    # unless user_signed_in?
    #   redirect_to new_user_session_path
    # else
    @item = Item.new
    @item.images.build
    # end
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
    @item = Item.find(params[:id])
    other_items = Item.where.not(id: params[:id])
    @user_items = other_items.where(user_id: @item.user.id).limit(6)
    # @category_items = other_items.where(category_id: @item.category_id).limit(6)
  end

  def edit
  end

  def update
  end

  def destroy

  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :detail,
      :category_id,
      :condition_id,
      :shipping_fee_charge_to,
      :prefecture_id,
      :shipping_days,
      :shipping_cost,
      :brand_id,
      images_attributes: [:images]
    ).merge(user_id: 1)
  end
end
