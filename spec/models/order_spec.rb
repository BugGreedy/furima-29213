require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '"user_id"と"item_id"が正しく紐付けられていれば購入できる' do
        expect(@order).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '"user_id"が正しく紐付けられていないと購入できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('User must exist')
      end

      it '"item_id"が正しく紐付けられていないと購入できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Item must exist')
      end
    end
  end
end
