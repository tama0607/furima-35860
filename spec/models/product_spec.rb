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
        expect(@product.errors.full_messages).to include("画像を入力してください")
      end
      it 'p_nameが空では登録されない' do
        @product.p_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空では登録されない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'category_idで1が選択された場合は登録されない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idで1が選択された場合は登録されない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
      it 'obligation_idで1が選択された場合は登録されない' do
        @product.obligation_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Obligation can't be blank")
      end
      it 'prefecture_idで1が選択された場合は登録されない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'day_idで1が選択された場合は登録されない' do
        @product.day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Day can't be blank")
      end

      it 'priceが空では登録されない' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("価格を入力してください", "価格は不正な値です", "価格は数値で入力してください")
      end
      it 'priceが半角数字以外では登録できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが半角英数字混合では登録できない' do
        @product.price = '10aa'
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが半角英語では登録できない' do
        @product.price = 'aaaa'
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが300より少ないと登録できない' do
        @product.price = 50
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は299より大きい値にしてください")
      end
      it 'priceが9999999より多いと登録できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は10000000より小さい値にしてください")
      end
      it 'ユーザーが紐付いていないと出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end


    end
  end
end