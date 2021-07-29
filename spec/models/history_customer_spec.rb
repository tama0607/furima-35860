require 'rails_helper'

RSpec.describe HistoryCustomer, type: :model do
  describe '購入者情報の保存' do
    before do
      @history_customer = FactoryBot.build(:history_customer)
    end

      it '全ての項目が入力されていれば購入ができる' do
        expect(@history_customer).to be_valid
      end
      it 'token(クレジットカード情報)が空だと購入ができない' do
        @history_customer.token = nil
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入ができない' do
        @history_customer.postal_code = ""
        @history_customer.valid?
        expect(@history_customer.errors.messages).to include({:postal_code => ["can't be blank", "is invalid", "is the wrong length (should be 8 characters)"]})
      end
      it '郵便番号にハイフンがないと登録できない' do
        @history_customer.postal_code = "12345678"
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号が8桁でないと購入できない' do
        @history_customer.postal_code = "123-458"
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("Postal code is invalid", "Postal code is the wrong length (should be 8 characters)")
      end
      it '郵便番号二文字が含まれていると購入できない' do
        @history_customer.postal_code = "123-45あ"
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが空だと購入できない' do
        @history_customer.prefecture_id = nil
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが１だと購入できない' do
        @history_customer.prefecture_id = 1
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipalityが空だと購入できない' do
        @history_customer.municipality = ""
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できない' do
        @history_customer.address = ""
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @history_customer.phone_number = ""
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberが英数字混合の場合は購入できない' do
        @history_customer.phone_number = "080123456ab"
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空だと購入できない' do
        @history_customer.user_id = ""
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idrが空だと購入できない' do
        @history_customer.product_id = ""
        @history_customer.valid?
        expect(@history_customer.errors.full_messages).to include("Product can't be blank")
      end
  end
end