class Transaction::BuyController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def create
  end

  def pay
    @item = Item.find(params[:id])
    @item.trade_status_id = 2
    @item.save
    Payjp.api_key = 'sk_test_1721473b3cfd0970b82ecfda'
    charge = Payjp::Charge.create(
    amount: @item.shipping_cost,
    card: params['payjp-token'],
    currency: 'jpy',
    )
  end

end
