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

    context '新規投稿ができないとき' do
      it 'contentが空だと保存できない' do
        @post.content = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("投稿内容を入力してください")
      end
      it 'contentが141文字以上だと保存できない' do
        @post.content = Faker::Lorem.characters(number: 141)
        @post.valid?
        expect(@post.errors.full_messages).to include("投稿内容は140文字以内で入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
