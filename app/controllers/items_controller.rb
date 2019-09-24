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
    @item = Item.new
    @item.images.build
    # end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      image_params[:images].each do |image|
        @item.images.create(image: image, item_id: @item.id) 
      end
      redirect_to items_path
    end
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
    # @item.destroy if @item.user_id === current_user.id
    # redirect_to root_path
  end

  private
  def item_params
    # params.require(:item).permit(:name, :price, :detail, :shipping_cost, :shipping_fee_charge_to, :shipping_from, :shipping_days, :condition_id, :trade_status_id, :brand_id, images_attributes: [:image]).merge(user_id: "1")
    params.require(:item).permit(
      :name,
      :price,
      :detail,
      images_attributes: [:id, :image]
    ).merge(user_id: 1)
  end

  def image_params
    params.require(:images).permit({images: []})
  end
end