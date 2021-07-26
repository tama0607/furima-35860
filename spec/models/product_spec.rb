require 'rails_helper'

describe Product, type: :model do

  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が入力されていれば出品ができる' do
        expect(@product).to be_valid
      end
    
    context '商品出品がうまくいかないとき' do
      it 'imageが空では登録されない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'p_nameが空では登録されない' do
        @product.p_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("P name can't be blank")
      end
      it 'descriptionが空では登録されない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
        it 'category_idが空では登録されない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
        it 'status_idが空では登録されない' do
        @product.status_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
        it 'obligation_idが空では登録されない' do
        @product.obligation_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Obligation can't be blank")
      end
      it 'prefecture_idが空では登録されない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'day_idが空では登録されない' do
        @product.day_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Day can't be blank")
      end
      it 'それぞれのidで1が選択された場合は登録されない' do
        @product.category_id = '1'
        @product.status_id = '1'
        @product.obligation_id = '1' 
        @product.prefecture_id = '1'
        @product.day_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can be blank","Status can be blank","Obligation can be blank","Prefecture can be blank","Day can be blank")
      end
      it 'priceが空では登録されない' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end
      it 'priceが半角数字以外では登録できない' do
        @product.price = "１０００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300より少ないと登録できない' do
        @product.price = "50"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'priceが9999999より多いと登録できない' do
        @product.price = "10000000"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than 9999999")
      end
    end

    end
  end
end