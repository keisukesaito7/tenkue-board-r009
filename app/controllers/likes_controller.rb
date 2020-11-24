class LikesController < ApplicationController
  before_action :set_post

  def create
    like = Like.create(user_id: current_user.id, post_id: @post.id)
    redirect_back(fallback_location: post_path(@post))
  end

  def destroy
    Like.find_by(user_id: current_user.id, post_id: @post).destroy
    redirect_back(fallback_location: post_path(@post))
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
