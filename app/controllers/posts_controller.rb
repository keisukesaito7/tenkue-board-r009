class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
  end

  def create
    # @post = Post.new(post_params)
    # if @post.save
    #   flash[:success] = "登録しました"
    #   redirect_to root_path
    # else
    #   render 'posts/new'
    # end
  end

  private
    # def post_params
    #   params.require(:post).permit(:content).merge(user_id: current_user.id)
    # end
end
