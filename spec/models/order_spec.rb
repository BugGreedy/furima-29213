require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
    @address = FactoryBot.build(:address)
  end

  describe '商品出品' do
    context '商品購入がうまくいくとき' do
      it '入力欄に正しく記入できていれば購入できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '商品名が空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end