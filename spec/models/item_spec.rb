require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context '出品登録できるとき' do
      it '全項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'category_idに「---」が選択されている場合は登録できない' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'condition_idに「---」が選択されている場合は登録できない' do
        @item.condition_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'fee_idが空では登録できない' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee can't be blank"
      end
      it 'fee_idに「---」が選択されている場合は登録できない' do
        @item.fee_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee can't be blank"
      end
      it 'area_idが空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'area_idに「---」が選択されている場合は登録できない' do
        @item.area_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'deliverydate_idが空では登録できない' do
        @item.deliverydate_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Deliverydate can't be blank"
      end
      it 'deliverydate_idに「---」が選択されている場合は登録できない' do
        @item.deliverydate_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Deliverydate can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが¥299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price ¥300以上¥9,999,999以下の半角数値で入力してください"
      end
      it 'priceが¥10,000,000以下では登録できない' do
        @item.price = '10,000,001'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price ¥300以上¥9,999,999以下の半角数値で入力してください"
      end
      it 'priceが半角英字では登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price ¥300以上¥9,999,999以下の半角数値で入力してください"
      end
      it 'priceが全角では登録できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price ¥300以上¥9,999,999以下の半角数値で入力してください"
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
         expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
