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
  end
end
