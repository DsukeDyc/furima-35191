require 'rails_helper'

RSpec.describe AddressBook, type: :model do
  describe '購入者の配送先の保存' do
    before do
      # order = FactoryBot.create(:order)
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @address_book = FactoryBot.build(:address_book, user_id: user.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address_book).to be_valid?
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存ができないこと' do
        @address_book.postal_code = ''
        @address_book.valid?
        expect(@address_book.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @address_book.postal_code = '1234567'
        @address_book.valid?
        expect(@address_book.errors.full_messages).to include('Postal code is invalid. Include hypten(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @address_book.prefecture_id = 0
        @address_book.valid?
        expect(@address_book.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できないこと' do
        @address_book.city = ''
        expect(@address_book).to be_valid?
      end
      it 'house_numberが空では保存できないこと' do
        @address_book.house_number = ''
        expect(@address_book).to be_valid?
      end
      it 'building_nameは空でも保存できること' do
        @address_book.building_name = ''
        expect(@address_book).to be_valid?
      end
      it 'telが空では保存できないこと' do
        @address_book.tel = nil
        @address_book.valid?
        expect(@address_book.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが全角数字だと保存できないこと' do
        @address_book.price = '２０００'
        @address_book.valid?
        expect(@address_book.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが11桁でないと保存できないこと' do
        @address_book.tel = '00000000000'
        @address_book.valid?
        expect(@address_book.errors.full_messages).to include('Tel is invalid')
      end
      it 'orderが紐づいていないと保存できないこと' do
        @address_book.order_id = nil
        @address_book.valid?
        expect(@address_book.errors.full_messages).to include('Order must exist')
      end
    end
  end
end
