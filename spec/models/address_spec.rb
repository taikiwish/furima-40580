require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '住所情報の保存' do
    context '住所情報が保存できるとき' do
      it '全項目が存在すれば保存できる' do
        expect(@address).to be_valid
      end
    end
    context '住所情報が保存できないとき' do
      it 'zipcodeが空では保存できない' do
        @address.zipcode = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Zipcode can't be blank"
      end
      it 'zipcodeが正しい形式でないと保存できない' do
        @address.zipcode = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include "Zipcode is invalid. Include hyphen(-)"
      end
      it 'area_idが空では保存できない' do
        @address.area_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Area can't be blank"
      end
      it 'cityが空では保存できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "City can't be blank"
      end
      it 'numberが空では保存できない' do
        @address.number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Number can't be blank"
      end
      it 'phoneが空では保存できない' do
        @address.phone = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone can't be blank"
      end
      it 'phoneが正しい形式でないと保存できない' do
        @address.phone = '090-1234-5678'
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone must be 10 or 11 digits"
      end
      it 'purchaseが紐付いていなければ保存できない' do
        @address.purchase = nil
        @address.valid?
        expect(@address.errors.full_messages).to include "Purchase must exist"
      end
    end
  end
end