require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context '登録成功' do
      it 'nickname、email、password、password_confirmation、family_name、first_name、family_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '登録失敗' do
      it 'Nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Nicknameを入力してください')
      end
      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '重複したemailだと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'Emailに@がない場合' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = '1234512345'
        @user.password_confirmation = '1234512345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが存在してもpassword_confirmationが空の場合は登録できない' do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）を入力してください')
      end
      it 'ユーザー本名の名字が空だと登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は不正な値です')
      end
      it 'ユーザー本名の名前が空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名は不正な値です')
      end
      it 'ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.family_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は不正な値です')
      end
      it 'ユーザー本名の名前は（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は不正な値です')
      end
      it 'ユーザー本名の名字のフリガナが空だと登録できない' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('姓（カナ）は不正な値です')
      end
      it 'ユーザー本名の名前のフリガナが空だと登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名（カナ）は不正な値です')
      end
      it 'ユーザー本名のフリガナは全角（カタカナ）でなければ登録できない' do
        @user.family_name_kana = 'ﾃｽﾄ'
        @user.first_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓（カナ）は不正な値です', '名（カナ）は不正な値です')
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
      context
    end
  end
end
