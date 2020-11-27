class CommentsController < ApplicationController
  before_action :set_post, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_comments, only: [:edit, :update]
  
  def new
    redirect_to post_path(@post.id)
  end
  
  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post.id)
    else
      flash[:alert] = 'コメントを(140文字以内で)入力してください。'
      render 'posts/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post.id)
  end

  def edit
    render 'posts/show'
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post.id)
    else
      flash[:alert] = 'コメントを(140文字以内で)入力してください。'
      render 'posts/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_comments
    @comments = @post.comments.includes(:user).order("created_at DESC")
  end
  
  def set_post
    @post = Post.find(params[:post_id])
  end
end
