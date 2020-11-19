class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to root_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
    redirect_to root_path
  end

end
