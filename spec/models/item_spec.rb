require 'rails_helper'
describe Item do

  describe '#create' do
    it "nameが空だと保存できない" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "detailが空だと保存できない" do
      item = build(:item, detail: "")
      item.valid?
      expect(item.errors[:detail]).to include("を入力してください")
    end

    it "shipping_costが空だと保存できない" do
      item = build(:item, shipping_cost: "")
      item.valid?
      expect(item.errors[:shipping_cost]).to include("を入力してください")
    end

    it "shipping_fee_charge_toが空だと保存できない" do
      item = build(:item, shipping_fee_charge_to: "")
      item.valid?
      expect(item.errors[:shipping_fee_charge_to]).to include("を入力してください")
    end

    it "shipping_daysが空だと保存できない" do
      item = build(:item, shipping_days: "")
      item.valid?
      expect(item.errors[:shipping_days]).to include("を入力してください")
    end

    it "condition_idが空だと保存できない" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it "category_idが空だと保存できない" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "trade_status_idが空だと保存できない" do
      item = build(:item, trade_status_id: "")
      item.valid?
      expect(item.errors[:trade_status_id,]).to include("を入力してください")
    end

    it "brand_idが空だと保存できない" do
      item = build(:item, brand_id: "")
      item.valid?
      expect(item.errors[:brand_id]).to include("を入力してください")
    end

    it "prefecture_idが空だと保存できない" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "すべてを満たし登録を可とする" do
      item = create(:item)
      expect(item).to be_valid
    end
  end
end