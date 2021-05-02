require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    #item = FactoryBot.build(:item)
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品の保存' do
    context '商品の保存ができる場合' do
      it '画像と名前と説明とカテゴリーと状態と配送料の負担と発送元の地域と発送までの日数と販売価格があれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の保存ができない場合' do
      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '名前が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空では登録できない' do
        @item.type = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Type can't be blank")
      end
      it '状態が空では登録できない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が空では登録できない' do
        @item.shipping_cost = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送元の地域が空では登録できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が空では登録できない' do
        @item.shipdate = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipdate can't be blank")
      end
      it 'カテゴリーが---では登録できない' do
        @item.type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Type must be other than 1')
      end
      it '状態が---では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it '配送料の負担が---では登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost must be other than 1')
      end
      it '発送元の地域が---では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数が---では登録できない' do
        @item.shipdate_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipdate must be other than 1')
      end
      it '販売価格が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が全角英数混合では登録できない' do
        @item.price = '000Ａ-Ｚ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '販売価格が9,999,999円を超過すると保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '299円以下では登録ができないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'userが紐づいていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
