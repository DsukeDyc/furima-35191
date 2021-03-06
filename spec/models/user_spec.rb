require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail,passwordとpassword_confirmation,last_name,first_name,last_name_reading,first_name_reading,birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      context '新規登録できないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = '11aaa'
          @user.password_confirmation = '11aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'emailは@が記載されていないと登録できない' do
          @user.email = 'kkkgmail.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_name_readingが空では登録できない' do
          @user.last_name_reading = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name reading can't be blank")
        end
        it 'first_name_readingが空では登録できない' do
          @user.first_name_reading = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading can't be blank")
        end
        it 'birthが空では登録できない' do
          @user.birth = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth can't be blank")
        end
        it 'passwordが半角英語のみでは登録できない' do
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordが数字のみでは登録できない' do
          @user.password = '000000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordが全角英数混合では登録できない' do
          @user.password = '000Ａ-Ｚ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordとpassword_confirmationが一致しない場合は登録できない' do
          @user.password = '000aaa'
          @user.password_confirmation = '000aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'last_nameが全角（漢字•ひらがな•カタカナ）以外は登録できない' do
          @user.last_name = '/\A[ぁ-んァ-ヶ一-龥々ー]+\z/'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end
        it 'first_nameが全角（漢字•ひらがな•カタカナ）以外は登録できない' do
          @user.first_name = '/\A[ぁ-んァ-ヶ一-龥々ー]+\z/'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end
        it 'last_name_readingが全角（カタカナ）以外は登録できない' do
          @user.last_name = 'ｱｱｱｱｱｱｱ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end
        it 'first_name_readingが全角（カタカナ）以外は登録できない' do
          @user.first_name = 'ｱｱｱｱｱｱｱ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end
      end
    end
  end
end
