class ItemsController < ApplicationController

  def index
    @ladies_items = Item.limit(10).order("created_at DESC").where(category_id: '1')
    @mens_items = Item.limit(10).order("created_at DESC").where(category_id: '2')
    @home_appliance_items = Item.limit(10).order("created_at DESC").where(category_id: '3')
    @toy_items = Item.limit(10).order("created_at DESC").where(category_id: '4')
  end

  def new
  end

  def create
  end

  def search
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end