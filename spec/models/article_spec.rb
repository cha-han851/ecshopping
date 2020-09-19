require 'rails_helper'

describe Article do
  before do
    @article = FactoryBot.build(:article)
  end
  describe '投稿' do
    context '投稿が成功する場合' do
      it '必要な情報が正しく入力されている' do
        expect(@article).to be_valid
      end
    end
    context '投稿失敗' do
      it 'タイトルがない場合' do
        @article.title = nil
        @article.valid?
        expect(@article.errors.full_messages). to include('タイトルを入力してください')
      end
      it '内容がない場合' do
        @article.content = nil
        @article.valid?
        expect(@article.errors.full_messages). to include('内容を入力してください')
      end
    end
  end
end
