class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_post, only: [:show]

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'posts/new'
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content).merge(user_id: current_user.id)
    end

    def move_to_index
      unless user_signed_in?
        redirect_to root_path
      end
    end
end
