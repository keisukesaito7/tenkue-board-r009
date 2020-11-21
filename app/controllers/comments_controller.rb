class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:new, :create]
  
  def new
    redirect_to post_path(@post.id)
  end
  
  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post.id)
    else
      flash[:alert] = 'コメントを(140文字以内で)入力してください。'
      redirect_to post_path(@post.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end