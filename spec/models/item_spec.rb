require 'rails_helper'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('spec/testimages/image_test01.png')
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '入力欄に正しく記入できていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '商品名が空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '説明がないと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'カテゴリーを選択しないと出品できない' do
        @item.genre_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre は選択しないと出品できません')
      end

      it '商品の状態を選択しないと出品できない' do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition は選択しないと出品できません')
      end

      it '配送料の負担を選択しないと出品できない' do
        @item.shipping_charge_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge は選択しないと出品できません')
      end

      it '発送元の地域を選択しないと出品できない' do
        @item.shipping_place_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping place は選択しないと出品できません')
      end

      it '発送までの日数を選択しないと出品できない' do
        @item.shipping_date_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date は選択しないと出品できません')
      end

      it '価格を記入しないと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円未満では出品できない' do
        @item.price = rand(1..299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は半角数字で記入し、300〜9,999,999円にしてください')
      end

      it '価格が9,999,999円より高額では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は半角数字で記入し、300〜9,999,999円にしてください')
      end

      it '価格は半角数字でないと記入できない' do
        @item.price = 'お'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は半角数字で記入し、300〜9,999,999円にしてください')
      end
    end
  end
end