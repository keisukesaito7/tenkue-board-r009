require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context '新規投稿ができるとき' do
      it '全ての値が正しく入力されれば保存できる' do
        expect(@post).to be_valid
      end
    end
  end
end
