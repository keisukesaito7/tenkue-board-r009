require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録ができるとき' do
      it '全ての値が正しく入力されれば保存できる' do
        expect(@user).to be_valid
      end
      it 'passwordが8文字であれば保存できる' do
        @user.password = Faker::Internet.password(min_length: 8, max_length: 8)
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'passwordが32文字であれば保存できる' do
        @user.password = Faker::Internet.password(min_length: 32, max_length: 32)
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'nameが空だと保存できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'emailが空だと保存できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it '既に使われているemailでは保存できない' do
        @same_email_user = FactoryBot.build(:user)
        @same_email_user.email = @user.email
        @user.save
        @same_email_user.valid?
        expect(@same_email_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it 'emailに全角が含まれると保存できない' do
        @user.email = 'テスト@gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it 'passwordが空だと保存できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが7文字以下だと保存できない' do
        @user.password = Faker::Internet.password(min_length: 2, max_length: 7)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは8文字以上で入力してください")
      end
      it 'passwordが33文字以上だと保存できない' do
        @user.password = Faker::Internet.password(min_length: 33)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは32文字以内で入力してください")
      end
      it 'passwordが英字のみだと保存できない' do
        @user.password = "abcdefghij"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが数字のみだと保存できない' do
        @user.password = "0123456789"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'password_confirmationが空だと保存できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordとpassword_confirmationが一致しないと保存できない' do
        @user.password_confirmation = "newpass0123"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
