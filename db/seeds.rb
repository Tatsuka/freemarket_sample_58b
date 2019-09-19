# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create!(
  detail: 'ふつう',
  price: '2000',
  name: '商品②',
  shipping_cost: '200',
  shipping_fee_charge_to: '200',
  shipping_from: '200',
  shipping_days: '2',
  condition_id: '2',
  category_id: '2',
  trade_status_id: '2',
  brand_id: '2',
)
