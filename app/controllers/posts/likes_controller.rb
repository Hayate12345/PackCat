class Posts::LikesController < ApplicationController
  # ! 投稿にいいねするメソッド
  def like_create
    @like = Like.new(post_id: params[:post_id], user_id: current_user.id)

    if @like.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  # ! 投稿のいいねを解除するメソッド
  def like_destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)

    if @like.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end
