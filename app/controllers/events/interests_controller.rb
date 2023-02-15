class Events::InterestsController < ApplicationController
  # ! イベントにいいねするメソッド
  def like_create
    @like = Interest.new(event_id: params[:event_id], user_id: current_user.id)

    if @like.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  # ! イベントのいいねを解除するメソッド
  def like_destroy
    @like = Interest.find_by(event_id: params[:event_id], user_id: current_user.id)

    if @like.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end
