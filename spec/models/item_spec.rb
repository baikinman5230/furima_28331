require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/katano.png')
  end

  describe '出品情報の保存' do
    context "出品情報が保存できる場合" do
      it "指定された全ての情報があれば保存できる" do
        expect(@item).to be_valid
      end
    end
    context "出品情報が保存できない場合" do
      it "productが空では保存できない" do
        @item.product = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it "discriptionが空では保存できない" do
        @item.discription = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Discription can't be blank")
      end
      it "imageが空では保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "category_idが空では保存できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが1の時、保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "product_condition_idが空では保存できない" do
        @item.product_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it "product_condition_idが1の時、保存できない" do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 1")
      end
      it "shipping_fee_burde_idが空では保存できない" do
        @item.shipping_fee_burde_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burde can't be blank")
      end
      it "shipping_fee_burde_idが1の時、保存できない" do
        @item.shipping_fee_burde_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burde must be other than 1")
      end
      it "shipping_region_idが空では保存できない" do
        @item.shipping_region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region can't be blank")
      end
      it "shipping_region_idが1の時、保存できない" do
        @item.shipping_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region must be other than 1")
      end
      it "days_until_shipping_idが空では保存できない" do
        @item.days_until_shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping can't be blank")
      end
      it "days_until_shipping_idが1の時、保存できない" do
        @item.days_until_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping must be other than 1")
      end
      it "priceが空では保存できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it "priceが300より小さい値では保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9,999,999より大きい値では保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
