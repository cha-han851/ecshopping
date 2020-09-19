require 'rails_helper'

describe Product do
  before do
    @product = FactoryBot.build(:product, :with_image)
  end

  describe '出品' do
    context '出品が成功する場合' do
      it '必要な情報が正しく入力されている' do
        expect(@product).to be_valid
      end
    end

    context '商品の出品失敗' do
      it '商品画像が空だと出品できない' do
        @product.images = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('画像を入力してください')
      end
      it '商品名が空だと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('商品名を入力してください')
      end
      it '商品の説明が空だと出品できない' do
        @product.description = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('説明を入力してください')
      end
      it 'ブランドを選択していないと出品できない' do
        @product.brand = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('ブランドを入力してください')
      end

      it '発送までの日数を選択していないと出品できない' do
        @product.ship_day = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('発送日を入力してください')
      end

      it '価格が空だと出品できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('価格を入力してください')
      end

      it '価格が300円未満だと出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は300以上の値にしてください')
      end

      it '価格が9999999円を超えると出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
    end
  end
end
