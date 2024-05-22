require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '購入情報の保存' do
    context '購入情報が保存できるとき' do
      it '全項目が存在すれば保存できる' do
        expect(@purchase_address).to be_valid
      end
    end
    context '購入情報が保存できないとき' do
      it 'zipcodeが空では保存できない' do
        @purchase_address.zipcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Zipcode can't be blank"
      end
      it 'zipcodeが正しい形式でないと保存できない' do
        @purchase_address.zipcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Zipcode is invalid. Include hyphen(-)"
      end
      it 'area_idが空では保存できない' do
        @purchase_address.area_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Area can't be blank"
      end
      it 'cityが空では保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "City can't be blank"
      end
      it 'numberが空では保存できない' do
        @purchase_address.number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Number can't be blank"
      end
      it 'phoneが空では保存できない' do
        @purchase_address.phone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone can't be blank"
      end
      it 'phoneが正しい形式でないと保存できない' do
        @purchase_address.phone = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone must be 10 or 11 digits"
      end
      it 'user_idが空では保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空では保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end