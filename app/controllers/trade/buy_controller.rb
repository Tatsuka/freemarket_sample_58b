class Trade::BuyController < ApplicationController

  before_action :set_item,only:[:show,:pay]

  def show
  end

  def create
  end

  def pay
    @item.update(trade_status_id: 2)
    Payjp.api_key = 'sk_test_1721473b3cfd0970b82ecfda'
    charge = Payjp::Charge.create(
    amount: @item.shipping_cost,
    card: params['payjp-token'],
    currency: 'jpy',
    )
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
