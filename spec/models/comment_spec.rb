require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe '新規コメント投稿' do
    context '新規投稿ができるとき' do
      it '全ての値が正しく入力されれば保存できる' do
        expect(@comment).to be_valid
      end
    end

    context '新規投稿ができないとき' do
      it 'commentが空だと保存できない' do
        @comment.comment = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Commentを入力してください")
      end
      it 'commentが141文字以上だと保存できない' do
        @comment.comment = Faker::Lorem.characters(number: 141)
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Commentは140文字以内で入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end
      it 'postが紐付いていないと保存できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Postを入力してください")
      end
    end
  end
end
