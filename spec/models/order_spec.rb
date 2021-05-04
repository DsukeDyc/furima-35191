require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品の購入記録' do
    before do
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid?
      end
    end

    context '内容に問題がある場合' do
      it '画像がないと登録できない' do
        @order.image = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Image can't be blank")
      end
      it '名前が空では登録できない' do
        @order.name = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Name can't be blank")
      end
      it '配送料の負担が空では登録できない' do
        @order.shipping_cost = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '販売価格が空では登録できない' do
        @order.price = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
