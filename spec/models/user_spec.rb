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
    end
  end
end
