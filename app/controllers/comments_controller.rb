class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post.id)
    else
      flash.now[:notice] = 'コメントを(140文字以内で)入力してください。'
      redirect_to post_path(@post.id)
    end
  end
end
