class LikesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_back(fallback_location: post_path(params[:post_id]))
  end

  def destroy
    Like.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
    redirect_back(fallback_location: post_path(params[:post_id]))
  end

end
