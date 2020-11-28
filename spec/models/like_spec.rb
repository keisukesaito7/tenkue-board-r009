require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'いいね' do
    context 'いいねができるとき' do
      it 'まだいいねしていない投稿にはいいねができる' do
        expect(@like).to be_valid
      end
    end

    context 'いいねができないとき' do
      it 'userが紐付いていないと保存できない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Userを入力してください")
      end
      it '投稿が紐付いていないと保存できない' do
        @like.post = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Postを入力してください")
      end
      it '既にいいねをした投稿にはいいねができない' do
        @like.save
        @like_repeat = FactoryBot.build(:like)
        @like_repeat.user = @like.user
        @like_repeat.post = @like.post
        @like_repeat.valid?
        expect(@like_repeat.errors.full_messages).to include("Postはすでに存在します")
      end
    end
  end
end
