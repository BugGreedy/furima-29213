require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入時の送付先登録' do
    context '商品購入がうまくいくとき' do
      it '"正しく入力できていれば送付先の登録ができる' do
        expect(@address).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '郵便番号がないと登録できない' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include
      end

      it '郵便番号は"###-####"の形で記入しないと登録できない' do
        @address.postal_code = '0000000'
        @address.valid?
        expect(@address.errors.full_messages).to include
      end

      it '都道府県を選択しないと登録できない' do
        @address.prefecture_id = '0'
        @address.valid?
        expect(@address.errors.full_messages).to include
      end

      it '市町区村を入力しないと登録できない' do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include
      end

      it '番地を入力しないと登録できない' do
        @address.house_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include
      end

      it '電話番号を入力しないと登録できない' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include
      end

      it '電話番号はハイフンなしで11桁以下で半角数字で入力しないと登録できない' do
        @address.phone_number = 'aaaaaaaaaaaaaaa'
        @address.valid?
        expect(@address.errors.full_messages).to include
      end
    end
  end
end
