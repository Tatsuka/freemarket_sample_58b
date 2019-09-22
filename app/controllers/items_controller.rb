class ItemsController < ApplicationController

  def index
    @ladies_items = Item.extraction(1)
    @mens_items = Item.extraction(2)
    @home_appliance_items = Item.extraction(3)
    @toy_items = Item.extraction(4)

  end

  def new
  end

  def create
  end

  def search
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end